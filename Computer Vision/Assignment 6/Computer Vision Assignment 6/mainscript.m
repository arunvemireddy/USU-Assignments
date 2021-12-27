ballimg = imread("ball.bmp");
ballimg2hsv = rgb2hsv(ballimg);
ballhue = ballimg2hsv(:,:,1);
ballhueBinary = ballhue < 0.25;
interImg1 = ballhueBinary;
structureEle1 = strel('disk',3);
structureEle2 = strel('disk',5);
img = imdilate(ballhueBinary,structureEle1);
interImg2 = img;
img = imerode(img,structureEle2);
interImg3 = img;
img = imclearborder(interImg3);
interImg4 = img;
ballImage = interImg4;
[row,col]= find(img==1);
minCol = min(col(:));
maxCol = max(col(:));
minRow = min(row(:));
maxRow = max(row(:));

centerX = floor(((minCol+maxCol))/2);
centerY = floor(((minRow+maxRow))/2);
markedIm = insertMarker(ballimg,[centerX,centerY],'size',10,'color','blue');
figure();
subplot(2,2,1),imshow(interImg1),title('Hue Space After Thresholding');
subplot(2,2,2),imshow(interImg2);title('Intermediate Image After Dilation');
subplot(2,2,3),imshow(interImg3);title('Intermediate Image after Erosion');    
subplot(2,2,4),imshow(interImg4);title('border cleared Image');
pause;
figure();imshow(markedIm);title("marked Centroid");
pause;
'____Finished Problem 1.1_____';
ballImg = imread('ball.bmp');
[row,col,channel]=size(ballImg);
ballImHSV = rgb2hsv(ballImg);
val = ballImHSV(:,:,3);
valBin = val<0.4;
interImg1 = valBin;
structureEle1 = strel('disk',3);
interImg2 = imdilate(interImg1,structureEle1);
figure();
subplot(2,3,1);imshow(interImg1);
subplot(2,3,2);imshow(interImg2);
structureEle2 = strel('disk',5);
interImg3 = imerode(interImg2,structureEle2);
subplot(2,3,3);imshow(interImg3);
structureEle3 = strel('disk',2);        
interImg4 = imdilate(interImg3,structureEle3);
subplot(2,3,4);imshow(interImg4);
subplot(2,3,5);imshow(imclearborder(interImg4));
interImg5 = imclearborder(interImg4)-ballImage;
subplot(2,3,6);imshow(interImg5);
pause;
figure();
outputIm = HighlighShadow(interImg5);
imshow(outputIm);title('shadow highlighted Image');
pause;
'____Finished Problem 1.2_____';
disp('implemented CallNormalized Function');
'____Finished Problem 2.1___';
elephant1Img = imread('Elephant1.jpg');
elephant2Img = imread('Elephant2.jpg');
horse1Img = imread('Horse1.jpg');
horse2Img = imread('Horse2.jpg');

imh1 = CalNormalizedHSVHist(elephant1Img,4,4,4);
imh2 = CalNormalizedHSVHist(elephant2Img,4,4,4);
imh3 = CalNormalizedHSVHist(horse1Img,4,4,4);
imh4 = CalNormalizedHSVHist(horse2Img,4,4,4);

figure();
subplot(2,2,1),bar(imh1);
subplot(2,2,2),bar(imh2);
subplot(2,2,3),bar(imh3);
subplot(2,2,4),bar(imh4);
pause;

[im1,im2,im3,im4,output]=queryDBFunc(elephant1Img,elephant2Img,horse1Img,horse2Img);

subplot(2,2,1);imshow(im1);title(string(output(1,2)));
subplot(2,2,2);imshow(im2);title(string(output(2,2)));
subplot(2,2,3);imshow(im3);title(string(output(3,2)));
subplot(2,2,4);imshow(im4);title(string(output(4,2)));
pause;
figure();
[im1,im2,im3,im4,output]=queryDBFunc(elephant2Img,elephant1Img,horse1Img,horse2Img);
subplot(2,2,1);imshow(im1);title(string(output(1,2)));
subplot(2,2,2);imshow(im2);title(string(output(2,2)));
subplot(2,2,3);imshow(im3);title(string(output(3,2)));
subplot(2,2,4);imshow(im4);title(string(output(4,2)));
pause;
[im1,im2,im3,im4,output]=queryDBFunc(horse1Img,elephant2Img,elephant1Img,horse2Img);
subplot(2,2,1);imshow(im1);title(string(output(1,2)));
subplot(2,2,2);imshow(im2);title(string(output(2,2)));
subplot(2,2,3);imshow(im3);title(string(output(3,2)));
subplot(2,2,4);imshow(im4);title(string(output(4,2)));
pause;
[im1,im2,im3,im4,output]=queryDBFunc(horse2Img,elephant2Img,elephant1Img,horse1Img);
subplot(2,2,1);imshow(im1);title(string(output(1,2)));
subplot(2,2,2);imshow(im2);title(string(output(2,2)));
subplot(2,2,3);imshow(im3);title(string(output(3,2)));
subplot(2,2,4);imshow(im4);title(string(output(4,2)));
pause;


'____Finished Problem 2.2___';
lenaImg = imread('Lena.jpg');
dwtmode('per');
[CA1,CH1,CV1,CD1] = dwt2(lenaImg,'db9');
[CA2,CH2,CV2,CD2]= dwt2(CA1,'db9');
[CA3,CH3,CV3,CD3]= dwt2(CA2,'db9');
[row,col]=size(CA3);
waterMark = ones(row,col);
for i = 1:row
    for j = 1:col
        if(mod(i,2)~=0)
            waterMark(i,j)=0;
        end
    end
end
watermarkImg = waterMarkFunction(CA3,waterMark);
CA2 = idwt2(watermarkImg,CH3,CV3,CD3,'db9');
CA1 = idwt2(CA2,CH2,CV2,CD2,'db9');
resImg = idwt2(CA1,CH1,CV1,CD1,'db9');
figure();
subplot(1,3,1);imshow(lenaImg),title('Original Image');
subplot(1,3,2);imshow(uint8(resImg));title('Watermark Image');
differenceImg = lenaImg - uint8(resImg);
mindifferenceImg = min(differenceImg(:));
maxdifferenceImg = max(differenceImg(:));
scaledSlope = (differenceImg - mindifferenceImg)./(maxdifferenceImg-mindifferenceImg);
scaleddiffImg = scaledSlope .*255;
subplot(1,3,3);imshow(scaleddiffImg);title('differenceImge');
pause;

'____Finish Problem 3.1____';
resImg = uint8(resImg);
[CA1,CH1,CV1,CD1] = dwt2(resImg,'db9');
[CA2,CH2,CV2,CD2]= dwt2(CA1,'db9');
[CA3,CH3,CV3,CD3]= dwt2(CA2,'db9');
newB = extractionFunction(CA3);
[row,col] = size(newB);
count=0;
total=0;
for i=1:row
    for j=1:col
        if(newB(i,j)==waterMark(i,j))
            count = count+1;
        end
        total=total+1;
    end
end
disp('percentage of number of matched bits is')
disp((count/total)*100);
pause;
'____Finish Problem 3.2____';
close all;

