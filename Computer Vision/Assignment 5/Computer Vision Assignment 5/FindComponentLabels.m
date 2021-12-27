function [labelIm, num] = FindComponentLabels(im, se)
    labelIm = zeros(size(im));
    [row,col] = size(im);
    num = 0;
    for i = 1:row*col
            if im(i) == 1
                im1 = zeros(size(im));
                im1(i) = 1;
                dilation = imdilate(im1,se);
                im2 = dilation & im; 
                 num= num + 1;
                while(~isequal(im2,im1))
                    im1 = im2;
                    dilation = imdilate(im1,se);
                    im2 = dilation & im;
                end
                im2Ones = find(im2 == 1);
                im(im2Ones) = 0;
                labelIm(im2Ones) = num;
            end
    end
end

