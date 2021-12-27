figure();
wirebondImg = imread("Wirebond.tif");
subplot(1,4,1),imshow(wirebondImg);title("Original Image");
structureEle1 = strel('disk',8);
wirebondImg1 = imerode(wirebondImg,structureEle1);
subplot(1,4,2),imshow(wirebondImg1);title("Desired Image 1");
structureEle2 = strel('disk',5);
wirebondImg2 = imerode(wirebondImg,structureEle2);
subplot(1,4,3),imshow(wirebondImg2);title("Desired Image 2");
structureEle3 = strel('square',42);
wirebondImg3 = imerode(wirebondImg,structureEle3);
subplot(1,4,4),imshow(wirebondImg3);title("Desired Image 3");
pause;
figure();
shapesImg = imread("Shapes.tif");
subplot(1,4,1),imshow(shapesImg);title("Original Image");
shapesstructureEle1 = strel('square',20);
shapesImg1 = imopen(shapesImg,shapesstructureEle1);
subplot(1,4,2),imshow(shapesImg1);title("Desired Image 1");
shapesstructureEle2 = strel('square',20);
shapesImg2 = imclose(shapesImg,shapesstructureEle2);
subplot(1,4,3),imshow(shapesImg2);title("Desired Image 2");
shapesImg2 = imerode(shapesImg2,shapesstructureEle2);
subplot(1,4,4),imshow(shapesImg2);title("Desired Image 2");
pause;
"____Finished Problem 1.1____";
figure();
dowelsImg = imread("Dowels.tif");
structureEle1 = strel('disk',5);
dowelsImg1 = imopen(dowelsImg,structureEle1);
dowelsImg1 = imclose(dowelsImg1,structureEle1);
subplot(1,2,1);imshow(dowelsImg1);title("open close image");
dowelsImg1 = imclose(dowelsImg,structureEle1);
dowelsImg1 = imopen(dowelsImg1,structureEle1);
subplot(1,2,2);imshow(dowelsImg1);title("close open image");
pause;
figure();
for i= 2:5
    structureEle1 = strel('disk',i);
    dowelsImg1 = imopen(dowelsImg,structureEle1);
    dowelsImg1 = imclose(dowelsImg1,structureEle1);
end
subplot(1,2,1);imshow(dowelsImg1);title("open close series image");
for i= 2:5
    structureEle1 = strel('disk',i);
    dowelsImg2 = imclose(dowelsImg,structureEle1);
    dowelsImg2 = imopen(dowelsImg2,structureEle1);
end
subplot(1,2,2);imshow(dowelsImg2);title("close open series image");
pause;
"____Finished Problem 1.2____";
smallsquareImg = imread("SmallSquares.tif");
csmallsquareImg = imcomplement(smallsquareImg);
structureEle1 = [0 1 0;0 1 1;0 0 0];
structureEle2 = [1 0 0;1 0 0;1 1 1];
erodesmallsquareImg = imerode(smallsquareImg,structureEle1);
erodecsmallsquareImg =  imerode(csmallsquareImg,structureEle2);

resIntsmallsquareImg = erodesmallsquareImg & erodecsmallsquareImg;
disp("number of foregroundpixel");
numofpix = sum(resIntsmallsquareImg,"all");
disp(numofpix);
"____Finished Problem 1.3____";
figure();
ballImg = imread("Ball.tif");
structureEle = strel('square',3);
[labelIm,num] = FindComponentLabels(ballImg,structureEle);
res = label2rgb(labelIm,'spring','c','shuffle');
disp('Number of Connected balls in the image using custom function');disp(num);
imshow(res);title('Connected objects labeled Image')
pause;
"____Finished Problem 2.1____";
figure();
ballImConnMat = bwconncomp(ballImg);
labelMatballImg = labelmatrix(ballImConnMat);
resultBallConnImMat = label2rgb(labelMatballImg,'spring','c','shuffle');
numberOfConnectedParticles = ballImConnMat.NumObjects;
disp('The number of Connected balls in the image using matlab function are');
disp(numberOfConnectedParticles);imshow(resultBallConnImMat);title('Ball Connected Components using Matlab function')
pause;
"____Finished Problem 2.2____";
figure();
ballImg = imread('Ball.tif');
structureEle = strel('square',3);
[ballImClearBorder,numberOfConnectedParticlesBorder] = borderballRemoval(ballImg,structureEle);
numberOfConnectedParticlesNBorder = numberOfConnectedParticles - numberOfConnectedParticlesBorder;
disp('Number of connected particles not residing in the border using custom function')
disp(numberOfConnectedParticlesNBorder);
subplot(1,2,1);imshow(ballImg);title('Original Image');
subplot(1,2,2);imshow(ballImClearBorder);title('image A')
pause;
"____Finished Problem 2.3____";
figure();
ballImClearBorderMat = imclearborder(ballImg);
ballImClearConnMat = bwconncomp(ballImClearBorderMat);
MnumberOfConnectedParticlesNBorder = ballImClearConnMat.NumObjects;
disp('Number of connected particles not residing in the border using matlab built in function')
disp(MnumberOfConnectedParticlesNBorder);
subplot(1,2,1);imshow(ballImClearBorder);title('image A')
subplot(1,2,2);imshow(ballImClearBorderMat);
title('image B')
pause;
"____Finished Problem 2.4____";
figure();
clearborderballImg = imclearborder(ballImg);
minConnPixelCount = pixCount(clearborderballImg);
[nonOverlapComps,nonOverlapCount] = nonOverlapPixel(clearborderballImg,minConnPixelCount);
disp('The number of non-overlapping components are')
disp(nonOverlapCount);
subplot(1,2,1);imshow(ballImg);title('Original Image')
subplot(1,2,2);imshow(nonOverlapComps);title('Non Overlapping Components')
pause;
"____Finished Problem 2.5____";
close all;
