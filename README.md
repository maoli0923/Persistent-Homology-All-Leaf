# Persistent-Homology-All-Leaf
This is the code (a reduced computational version) to measure leaf shape by persistent homology method

This package contains all Matlab functions needed to calculate the persistent homology output used in the analysis of >180,000 leaf shapes described in: 
Li M, An H, Angelovici R, Bagaza C, Batushansky A, Clark L, Coneva V, Donoghue MJ, Edwards E, Fajardo D, Fang H, Frank MH, Gallaher T, Gebken S, Hill T, Jansky S, Kaur B, Klahs PC, Klein LL, Kuraparthy V, Londo J, Migicovsky Z, Miller A, Mohn R, Myles S, Otoni WC, Pires JC, Rieffer E, Schmerler S, Spriggs E, Topp CN, Van Deynze A, Zhang K, Zhu L, Zink BM and Chitwood DH (2018) Topological Data Analysis as a Morphometric Method: Using Persistent Homology to Demarcate a Leaf Morphospace. Front. Plant Sci. 9:553. doi: 10.3389/fpls.2018.00553
https://www.frontiersin.org/articles/10.3389/fpls.2018.00553/full
 

Code is implemented by Mao Li (maoli0923@gmail.com).

A few remarks:

(a) The study was based on binary images.

(b) Place all contents of this package and all leaf images in a same folder such as "allleaf".

(c) Images can be in any standard format such as .jpg, .png, .tiff, etc. The default format for leaf image is .jpg

*************************************************************************************************************************************

In Matlab, set the working directory to the folder "allleaf", and execute the following Matlab command:
 
    >> PersistentHomology_allleaf


The output EC.mat is N-by-8000 matrix, where N is the number of images of leaves.
