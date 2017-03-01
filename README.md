# Persistent-Homology-All-Leaf
Software (a reduced computational version) for measuring leaf shape by persistent homology method

This package contains all Matlab functions needed to calculate the persistent homology output used in the analysis of >180,000 leaf shapes described in: 
Mao Li, Daniel H. Chitwood et al.A persistent homology leaf morphospace predicts plant family and region. 
 

Code is implemented by Mao Li (maoli0923@gmail.com).

A few remarks:

(a) The study was based on binary images.

(b) Place all contents of this package and all leaf images in a same folder such as "allleaf".

(c) Images can be in any standard format such as .jpg, .png, .tiff, etc. The default format for leaf image is .jpg

*************************************************************************************************************************************

In Matlab, set the working directory to the folder "allleaf", and execute the following Matlab command:
 
    >> PersistentHomology_allleaf


The output EC.mat is N-by-8000 matrix, where N is the number of images of leaves.
