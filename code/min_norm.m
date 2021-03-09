function [norm_val1,det_img_idx1,norm_val2,det_img_idx2,norm_val3,det_img_idx3] = min_norm(I, v1,v2,v3, ht1,ht2,ht3)
% Input
% v - left singular vector, NxM, where N - length of the data
% vector(128*128), M - training data set size
% ht - coefficient vector, projection of original data on singular vector space
% I - some image vector
% Output
% norm_val - the smallest distance
% det_img_idx - the closest point in training set -> detected image
%==========================================================================
% Please write your code here
coeff = v1'*I;
[~,k]=size(ht1);
norm_val1 = norm(coeff-ht1(:,1));
det_img_idx1 = 1;
for i = 2:k
    if norm(coeff-ht1(:,i)) <= norm_val1
        norm_val1 = norm(coeff-ht1(:,i));
        det_img_idx1 = i;
    end
end
coeff = v2'*I;
[~,k]=size(ht2);
norm_val2 = norm(coeff-ht2(:,1));
det_img_idx2 = 1;
for i = 2:k
    if norm(coeff-ht2(:,i)) <= norm_val2
        norm_val2 = norm(coeff-ht2(:,i));
        det_img_idx2 = i;
    end
end
coeff = v3'*I;
[~,k]=size(ht3);
norm_val3 = norm(coeff-ht3(:,1));
det_img_idx3 = 1;
for i = 2:k
    if norm(coeff-ht3(:,i)) <= norm_val3
        norm_val3 = norm(coeff-ht3(:,i));
        det_img_idx3 = i;
    end
end
%==========================================================================
    % project data on eigenvector space
    % compute distance to each point
    % find smallest distance(norm_val) and index(det_img_idx) 
end