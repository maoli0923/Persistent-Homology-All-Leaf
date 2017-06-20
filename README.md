# Persistent-Homology-All-Leaf
This is the code (a reduced computational version) to measure leaf shape by persistent homology method

This package contains all Matlab functions needed to calculate the persistent homology output used in the analysis of >180,000 leaf shapes described in: 
Mao Li, Daniel H. Chitwood et al. Persistent homology demarcates a leaf morphospace.bioRxiv 151712; doi: https://doi.org/10.1101/151712
 

Code is implemented by Mao Li (maoli0923@gmail.com).

A few remarks:

(a) The study was based on binary images.

(b) Place all contents of this package and all leaf images in a same folder such as "allleaf".

(c) Images can be in any standard format such as .jpg, .png, .tiff, etc. The default format for leaf image is .jpg

*************************************************************************************************************************************

In Matlab, set the working directory to the folder "allleaf", and execute the following Matlab command:
 
    >> PersistentHomology_allleaf


The output EC.mat is N-by-8000 matrix, where N is the number of images of leaves.
