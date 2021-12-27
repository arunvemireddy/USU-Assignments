function [edges,edgeHist] = FindEdgeInfo(im,bin)
edges = edge(im,'Canny');

 im = double(im);
    edgeHist = zeros(1,bin);
    xf = [-1 -2 -1;0 0 0;1 2 1];
    yf = [-1 0 1;-2 0 2;-1 0 1];
    imgx = imfilter(im,xf);
    imgy = imfilter(im,yf);
    matAngle = wrapTo360(atan2d(imgx,imgy));
    matAngle = matAngle(:);
    valuesperbin = ceil((max(matAngle(:)) - min(matAngle(:)) + 1)/bin);
    for i = 1:length(matAngle)
        val = floor(matAngle(i)/valuesperbin) + 1;
        edgeHist(val) = edgeHist(val)+1;
    end
end
