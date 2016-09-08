function [S] = im2segment(im)
% [S] = im2segment(im)

nrofsegments = 4;
m = size(im,1);
n = size(im,2);

% Thresholding algorithm. Set all 'pixels' < T = 0
% This improves contrast.
T=220;
im2 = im; im2(im2 < T) = 0;
% Invert the pixels (convert white -> black & black -> white)
im2 = not(im2)*255;

% Find the start and end of the entire group
% start_idx: Start of the characters
% end_idx  : End of the characters
% sum of a column of pixels exceeds 'threshold' => separation
threshold = 255*m*0.965;
row_sum = sum(im,1);
start_idx = find(row_sum < threshold, 1);
end_idx = n - find(fliplr(row_sum) < threshold, 1);
% row_sum = 1 where characters are present. Otherwise, its zero.
row_sum = row_sum(start_idx:end_idx) < threshold;

% Find each of the individual characters
segment_start=1;
for kk = 1:nrofsegments;
    segment_end = segment_start + find(row_sum(segment_start:end) < 1,1) - 1;
    temp = zeros(m,n); 
    temp_idx = start_idx +(segment_start:segment_end);
    temp(:,temp_idx) = im2(:,temp_idx);
    S{kk} = temp;
    segment_start = segment_end + find(row_sum(segment_end:end)>0,1) - 1;
end;
segment_end=length(row_sum);
temp_idx = start_idx +(segment_start:segment_end);
temp = zeros(m,n);
temp(:,temp_idx) = im2(:,temp_idx);
S{kk+1} = temp;