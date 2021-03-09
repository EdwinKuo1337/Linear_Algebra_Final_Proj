function G = load_set(begin_ID, end_ID, vec_length)
% This function loads data set from begin_ID to end_ID, with specified size
% from specified location
% vec_length is length of image vector
% matrix G is concatenation of all training vectors
%==========================================================================
% Please write your code here
n = 1 + end_ID - begin_ID;
m = vec_length;
G = zeros(m,n);
for i = begin_ID : end_ID
    v = load_img(i);
    G(1:vec_length,i-begin_ID+1) = v;
end
%==========================================================================
end