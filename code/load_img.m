function I = load_img(ID)
% this function loads data vector with specified ID, from specified location
%==========================================================================
% You don't need to change this function
%==========================================================================
fid = fopen(int2str(ID));
if fid == -1
    I = -1;
    return
end
I = fread(fid);
fclose(fid);
end