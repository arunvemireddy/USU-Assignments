function [maxfourvals] = maxfourmagnitudes(inputImg)
    fftInputImg = abs(inputImg);
    fftInputImg = sort(fftInputImg(:),'descend');
    maxfourvals = fftInputImg(2:2:8);
end