function [outputIm] = replacemaxfourmagnitudes(inputImg,maxfourvalues)
 inputImg = padarray(inputImg,[1 1],0,'both');
    [row,col] = size(inputImg);
    for i = 1:size(maxfourvalues)
        for j = 2:row-1
            for k = 2:col-1
                if abs(inputImg(j,k)) == maxfourvalues(i)
                     resmat = inputImg(j-1:j+1,k-1:k+1);
                     res = sum(resmat(:)) - inputImg(j,k);
                    inputImg(j,k) = res/8;
                end
            end
        end
    end
    outputIm = inputImg(2:row-1,2:col-1);
end

