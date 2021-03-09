function [v1,v2,v3,ht1,ht2,ht3] = comp_eig(G)
% This function computes eigenvectors and projection of data on 'eigenspace'
% v - left singular vector, NxM, where N - length of the data
% vector(128*128),M:training data set size.
% ht - coefficient vector, projection of original data on eigenspace
%==========================================================================
% Please write your code here
[U,~,~] = svd(G'*G);
v1 = G*U;
ht1 = v1'*G;
[k,q]=size(v1);
v2 = zeros(k,fix(q/10));
for i = 1:fix(q/10)
    v2(:,i)=v1(:,i);
end
v3 = zeros(k,fix(q/100));
for i = 1:fix(q/100)
    v3(:,i)=v1(:,i);
end
ht2 = v2'*G;
ht3 = v3'*G;
%==========================================================================
    % compute correlation matrix
    % compute eigenvector of R
    % use computational cheaper way to compute eigenvector of correlation
    % matrix
    % 'project' data
end

