function [im1,im2,im3,im4,output] = queryDBFunc(elephant1Img,elephant2Img,horse1Img,horse2Img)

imhist1 = CalNormalizedHSVHist(elephant1Img,4,4,4);
[row1,col1,cha]= size(elephant1Img);

imhist1 = imhist1 .*(row1*col1);

imhist2 = CalNormalizedHSVHist(elephant2Img,4,4,4);

[row,col,cha] = size(elephant2Img);

imhist2 = imhist2.*(row*col);

imhist3 = CalNormalizedHSVHist(horse1Img,4,4,4);

[row,col,cha] = size(horse1Img);

imhist3 = imhist3.*(row*col);

imhist4 = CalNormalizedHSVHist(horse2Img,4,4,4);

[row,col,cha] = size(horse2Img);

imhist4 = imhist4.*(row*col);

imgList = {elephant1Img,elephant2Img,horse1Img,horse2Img};

histList = {imhist1,imhist2,imhist3,imhist4};

for i = 1:4
        compImHist2 = histList{i};
        minHist = min(imhist1,compImHist2);
        sumHist = sum(minHist,'all');
        [row,col,ch] = size(imgList{i});
        score = sumHist/min(row1*col1,row*col);
        cell(i,:) = {imgList{i},score};
end

sortCell = sortrows(cell,2,'descend');

im1 = sortCell{1,1};
im2 = sortCell{2,1};
im3 = sortCell{3,1};
im4 = sortCell{4,1};
output=sortCell;

end

