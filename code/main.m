%% Initialize and constant configure

clear ;
close all;
addpath('../imgdata');
% please set parameters yourself

training_set_size = 1000; % training set size
num_test_img = 100; % number of testing images
num_test_each_img = 50; % how many time to test each image
testing_set_size = num_test_each_img*num_test_img; % testing set size
start_ID = 1223;    % first image name (don't change)
im_size = 128; % image size (don't change)
%% Processing training data
% matrix G is concatenation of all training vectors

G = load_set(start_ID,(start_ID + training_set_size - 1),im_size*im_size); % image set loading
G_avg = mean(G, 2);
G = G - repmat(G_avg, 1, training_set_size); % make input data zero-mean
[v1,v2,v3,ht1,ht2,ht3] = comp_eig(G);
% compute left and right singular vectors of input data
% v - eigenvector, NxM, where N - length of the data vector(128*128),
% M:training data set size.
% ht - coefficient vector, projection of original data on singular vector space

%% Face identification - 
snr = -26:2:-8;
prob_detect1 = zeros(size(snr));
prob_detect2 = zeros(size(snr));
prob_detect3 = zeros(size(snr));
for i = 1:numel(snr)
    snr_idx = snr(i);
    fprintf('Now SNR:%d\n',snr_idx);
    detect_cnt1 = 0;
    detect_cnt2 = 0;
    detect_cnt3 = 0;
    total_cnt = 0;
    for j = start_ID:(start_ID + num_test_img - 1)
        fprintf('-Now Image:%d\n',j);
        I = load_img(j); %load testing image
        for test_idx = 1:num_test_each_img
            test_img = awgn(I, snr_idx, 'measured'); % add noise
            test_img = test_img - G_avg; % zero-mean testing image
            [norm_val1,det_img_idx1,norm_val2,det_img_idx2,norm_val3,det_img_idx3] = min_norm(test_img,v1,v2,v3, ht1,ht2,ht3);
            if det_img_idx1 + start_ID - 1 == j
                detect_cnt1 = detect_cnt1 + 1; % count number of wrong identification
            end
            if det_img_idx2 + start_ID - 1 == j
                detect_cnt2 = detect_cnt2 + 1; % count number of wrong identification
            end
            if det_img_idx3 + start_ID - 1 == j
                detect_cnt3 = detect_cnt3 + 1; % count number of wrong identification
            end
            total_cnt = total_cnt + 1;
        end
    end
    prob_detect1(i) = detect_cnt1/total_cnt;
    prob_detect2(i) = detect_cnt2/total_cnt;
    prob_detect3(i) = detect_cnt3/total_cnt;
end

%% Plot figure PDvsSNR figure
figure;
semilogy(snr,1 - prob_detect1,'-r.',snr,1 - prob_detect2,'-g.',snr,1 - prob_detect3,'-b.');
title('Miss probability (100%(red) vs 10%(green) vs 1%(blue)) vs SNR');
xlabel('SNR (dB)');
ylabel('Miss probability (100%(red) vs 10%(green) vs 1%(blue))');
grid on;
figure;
semilogy(snr,1 - prob_detect1,'-r.');
title('Miss probability (100%) vs SNR');
xlabel('SNR (dB)');
ylabel('Miss probability (100%)');
grid on;
figure;
semilogy(snr,1 - prob_detect2,'-g.');
title('Miss probability (10%) vs SNR');
xlabel('SNR (dB)');
ylabel('Miss probability (10%)');
grid on;
figure;
semilogy(snr,1 - prob_detect3,'-b.');
title('Miss probability (1%) vs SNR');
xlabel('SNR (dB)');
ylabel('Miss probability (1%)');
grid on;

%% this is example on how you can view some image
%figure;
%id = start_ID;      % ID of the image you want to view
%I = load_img(id);    % Load image
%imagesc(reshape(I, im_size, im_size)'); colormap(gray(256)); % view image