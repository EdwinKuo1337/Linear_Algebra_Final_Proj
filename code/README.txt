1.For load_set:
	Import the set number of faces as a big matrix G.


2.For comp_eig.m:
	svd the matrix G’*G and make v1, ht1 G*G’ (matrix C)’s training image coefficient matrix and 10% eigenvector. 
	Make v2, ht2 G*G’ (matrix C)’s training image coefficient matrix and 100% eigenvector. 
	Finally, make v3, ht3 G*G’ (matrix C)’s training image coefficient matrix and 1% eigenvector.


3.For min_norm:
	First compute the testing image’s coefficient vector coeff, than compute the norm of: (1) coeff and ht1. (2) coeff and ht2. (3) coeff and ht3. 
	Find the smallest norm of these three set and set the responsible column as det_img_inx1, det_img_inx2 and det_img_inx3.


4.For main:
	Because I wanted to make the code output 4 kinds of figure (100% vs 10% vs 1%, 100%, 10%, 1%) at the same time (no need to change parameters manually), so I’ve set different variables for each of the condition (100%, 10% 1%). 
	Basically, the variables which ended with 1 meaning it’s for 100% and the ones which ended with 2 meaning it’s for 10%, and so on and so forth.
	As for the plotting section, there are 4 figure function, which are for 100% vs 10% vs 1%, 100%, 10% and 1% curves.

	*NOTE that the red curve ALWAYS references the 100%, the green curve ALWAYS references the 10% and the blue curve ALWAYS reference the 1% curve.
	

P.S.    1. I’ve changed the output of comp_eig(), it now outputs 6 matrix (v1, v2, v3, ht1, ht2, ht3)
	2. I’ve changed the input of min_norm(), it now takes 1 vector and 6 matrices (test_img, v1, v2, v3, ht1, ht2, ht3)
	3. I’ve changed the output of min_norm(), it now outputs 6 numbers (norm_val1, det_img_idx1, norm_val2, det_img_idx2, norm_val3, det_img_idx3)
