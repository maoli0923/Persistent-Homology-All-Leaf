%   Compute Euler characteristic (EC) for 16 rings for each leaf (a persistent homology approach)to measure leaf shape
%
%   Description: Input : binary image with black foreground and white
%                        background, the default format is .jpg which can
%                        be changed in line 41.
%                ( can be white foreground and black background, just delete line 44-46 and set h=I)
%
%                Output : N-by-8000 matrix, where N is the number of images.
%                (i,(j-1)*500+1:j*500)-elements are the EC of ring j for leaf i.
%
%   Author.....: Mao Li (maoli0923@gmail.com)
%   Date.......: March. 2017

%Step 1, disrete the subset of 2D plane which is large enough to include leaf into simplical complex (some triangles).
%Those could be changed, but we use them for this study.
bound1=-2;bound2=2;bound3=-2;bound4=2;  % set boundary value
extra=0; % margin parameter
l1=399;  % number of sets in x axis
l2=399;  % number of sets in y axis
hgrid=bound1-extra*(bound2-bound1)/l1:(bound2-bound1)/l1:bound2+extra*(bound2-bound1)/l1; % discrete x axis 
vgrid=bound3-extra*(bound4-bound3)/l2:(bound4-bound3)/l2:bound4+extra*(bound4-bound3)/l2; % discrete y axis 
[ysample,xsample]=meshgrid(vgrid,hgrid);% grid in 2D plane
clear U
U(:,1)=reshape(xsample,size(xsample,1)*size(xsample,2),1);U(:,2)=reshape(ysample,size(ysample,1)*size(ysample,2),1);
n1=length(hgrid);n2=length(vgrid);

load E % E includes the edges on 2D plane meshes
load Face % Face includes the triangles on 3D plane meshes

% Step 2, Compute persistent homology
% (Need to install javaplex package in Matlab)

% Those are parameters that could be changed. 
sigma0=0.085; %bandwith of Gaussian density estimator 
sigma=0.1;    %parameter to control the size of annulus
kN=16;        %number of rings

boundlow=-3; % set a uniform maximum value of all density functions.
step=500;    % discrete the function values into 500 sets
threshold=boundlow+(-boundlow)/step:(-boundlow)/step:0;
    
file=dir('*.jpg'); % change the format of image here.
clear EC
for k=1:length(file)
    I=imread(file(k).name); % load the image, the format .jpg can be changed
    h=zeros(size(I));
    a=find(I==0);
    h(a)=1;                 % switch black and white pixel 
    [start_r,start_c] = find(h,1,'first'); % get start point
    V = bwtraceboundary(h,[start_r start_c],'W',8,Inf,'counterclockwise'); % trace the contour
    V=V-repmat(mean(V),length(V),1); % translate the center to origin 
    V=V/norm(V,'fro')*sqrt(length(V)); %normalize leaf contour by centroid size
    F = ksdensity2d([V(:,1),V(:,2)],hgrid,vgrid,[sigma0,sigma0]); % Gaussian density estimator, some other person's code
    kai=zeros(kN,step);
    for t=1:kN
        G=exp(-abs(sum((U-repmat([0 0],size(U,1),1)).^2,2).^0.5-t*sigma).^2/(2*sigma^2))/(2*sigma*pi);
        Z=reshape(reshape(F,size(G)).*G,size(F));
        ZZ=-reshape(Z,n1*n2,1);
        s=find(min(ZZ)>threshold);
        for ii=size(s,2)+1:step
            a=find(ZZ<=threshold(ii));
            b=find(sum(ismember(E,a),2)==2);
            c=find(sum(ismember(Face,a),2)==3);
            kai(t,ii)=length(a)-length(b)+length(c);
        end
    end
    EC(k,:)=reshape(kai',1,8000);
end

save EC.mat EC -v7.3