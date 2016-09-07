function [S] = im2segment(im)
% [S] = im2segment(im)

nrofsegments = 4;
m = size(im,1);
n = size(im,2);

%
T=220;
im2 = im; im2(im2 < T) = 0;
im2 = not(im2)*255;

% find the start of each character
threshold = 255*m*0.965;
row_sum = sum(im,1);
start_idx = find(row_sum < threshold, 1);
end_idx = n - find(fliplr(row_sum) < threshold, 1);
row_sum = row_sum(start_idx:end_idx) < threshold;
%figure, plot(row_sum)
segment_start=1;
for kk = 1:nrofsegments;
    segment_end = segment_start + find(row_sum(segment_start:end) < 1,1) - 1;
    %fprintf('Segment %d, start = %d, end = %d\n', kk, start_idx+segment_start, start_idx+segment_end);
    temp = zeros(m,n); 
    temp(:,start_idx +(segment_start:segment_end)) = im2(:,start_idx+(segment_start:segment_end));
    S{kk} = temp;
    segment_start = segment_end + find(row_sum(segment_end:end)>0,1) - 1;
end;
segment_end=length(row_sum);
temp = zeros(m,n);
temp(:,start_idx +(segment_start:segment_end)) = im2(:,start_idx+(segment_start:segment_end));
S{kk+1} = temp;