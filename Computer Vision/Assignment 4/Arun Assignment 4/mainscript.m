figure();
sampleimg=imread('Sample.jpg');
[rowSize,colSize]=size(sampleimg);
guassianFilter = zeros(rowSize,colSize); 

sdURow=75;
sdVCol=25;
centerValueX= floor((rowSize)/2 + 1);
centerValueY= floor((colSize)/2 + 1);

for i=1:rowSize
    for j= 1:colSize
       guassianFilter(i,j)=exp((-1/2)*(((i - centerValueX)/sdURow).^2 + ((j - centerValueY)/sdVCol).^2));
    end
end

fftsampleImg = fft2(double(sampleimg));
fftShiftsampleImg=fftshift(fftsampleImg);
gaussconvfftimg= fftShiftsampleImg.*guassianFilter;
invShiftgaussconvfftimg=ifftshift(gaussconvfftimg);
filteredSampleImg= ifft2(invShiftgaussconvfftimg);
filteredSampleImg=uint8(filteredSampleImg);

subplot(1,3,1),imshow(sampleimg),title("Orginal Image");
subplot(1,3,2),imshow(guassianFilter),title("Gaussian Filter");
subplot(1,3,3),imshow(filteredSampleImg),title("Gaussian Filtered Image");
pause;
"____Finished Problem 1.1____";

figure();
butterworthFilter=zeros(rowSize,colSize);
cuttoffFrequency = 50;
order=2;
for i=1:rowSize
    for j= 1:colSize
        distance=sqrt(((i-(centerValueX)).^2 + (j-(centerValueY)).^2));
        butterworthFilter(i,j)=1-(1/(1+(distance/cuttoffFrequency))).^4;
    end
end

fftsampleImg = fft2(sampleimg);
fftShiftsampleImg=fftshift(fftsampleImg);
butterworthconvfftimg= fftShiftsampleImg .* butterworthFilter;
invShiftbutterworthconvfftimg=ifftshift(butterworthconvfftimg);
filteredSampleImg= uint8(real(ifft2(invShiftbutterworthconvfftimg)));
subplot(1,3,1),imshow(sampleimg),title("Orginal Image");
subplot(1,3,2),imshow(butterworthFilter),title("ButterWorth Filter - High Pass");
subplot(1,3,3),imshow(filteredSampleImg,[]),title("ButterWorth Filtered Image");
pause;

"____Finished Problem 1.2____";
sampleImg = imread('Sample.jpg');
capitalImg = imread('Capitol.jpg');
fftsampleImg = fft2(sampleImg);
fftcapitalImg = fft2(capitalImg);
fftshiftsampleImg = fftshift(fftsampleImg);
fftshiftcapitalImg = fftshift(fftcapitalImg);

realsampleImg = real(fftshiftsampleImg);
complexsampleImg= imag(fftshiftsampleImg);

realcapitalImg = real(fftshiftcapitalImg);
complexcapitalImg = imag(fftshiftcapitalImg);

magnitudesampleImg = ((realsampleImg.^2)+(complexsampleImg.^2)).^0.5;
magnitudecapitalImg = ((realcapitalImg.^2)+(complexcapitalImg.^2)).^0.5;

phasesampleIm = atan2(complexsampleImg,realsampleImg);
phasecapitalIm = atan2(complexcapitalImg,realcapitalImg);

logmagnitudesampleImg = log(1+magnitudesampleImg);
logmagnitudecapitalImg = log(1+magnitudecapitalImg);

minMagnitudesampleImg = min(logmagnitudesampleImg(:));
maxMagnitudesampleImg = max(logmagnitudesampleImg(:));

minPhasesampleImg = min(phasesampleIm(:));
maxPhasesampleImg = max(phasesampleIm(:));


minMagnitudecapitalImg = min(logmagnitudecapitalImg(:));
maxMagnitudecapitalImg = max(logmagnitudecapitalImg(:));

minphasecapitalIm = min(phasecapitalIm(:));
maxphasecapitalIm = max(phasecapitalIm(:));

scaledlogmagsampleImg =  (logmagnitudesampleImg - minMagnitudesampleImg)./(maxMagnitudesampleImg - minMagnitudesampleImg);
scaledphasesampleImg  =  (phasesampleIm - minPhasesampleImg)./(maxPhasesampleImg - minPhasesampleImg);

scaledlogmagcapitalImg = (logmagnitudecapitalImg - minMagnitudecapitalImg)./(maxMagnitudecapitalImg - minMagnitudecapitalImg);
scaledphasecapitalImg  =  (phasecapitalIm - minphasecapitalIm)./(maxphasecapitalIm - minphasecapitalIm);

figure();
subplot(2,2,1),imshow(scaledlogmagsampleImg),title('Sample Image Mag');
subplot(2,2,2),imshow(scaledphasesampleImg),title('Sample Image Phase');
subplot(2,2,3),imshow(scaledlogmagcapitalImg),title('Capital Image Magnitude');
subplot(2,2,4),imshow(scaledphasecapitalImg),title('Capital Image Phase');
pause;
"____Finished Problem 2.1____";
figure();
reccapitalImg = magnitudesampleImg .*exp(sqrt(-1) * phasecapitalIm);
reccapitalImg = ifftshift(reccapitalImg);
reccapitalImg = ifft2(reccapitalImg);
reccapitalImg = uint8(reccapitalImg);
subplot(1,2,1),imshow(reccapitalImg),title('reconstructed capital image');
recsampleImg = magnitudecapitalImg .*exp(sqrt(-1) * phasesampleIm);
recsampleImg = ifftshift(recsampleImg);
recsampleImg = ifft2(recsampleImg);
recsampleImg = uint8(recsampleImg);
subplot(1,2,2),imshow(recsampleImg),title('reconstructed sample image');
pause;
"____Finished Problem 2.2____";
boyNoisyIm = imread('boy_noisy.gif');
[ro,co]=size(boyNoisyIm);
fftBoyNoisyIm = fft2(boyNoisyIm);
fftCenterBoyNoisyIm = fftshift(fftBoyNoisyIm);
magnitudes = abs(fftCenterBoyNoisyIm);
centeredDFT = fftCenterBoyNoisyIm((ro/2)+1,(co/2)+1);
disp("centered DFT"+centeredDFT);
"____Finished Problem 3.1____";
maxFourValuesBoyNoisy = maxfourmagnitudes(fftCenterBoyNoisyIm);
"____Finished Problem 3.2____";
boyNoisyAfterReplace = replacemaxfourmagnitudes(fftCenterBoyNoisyIm,maxFourValuesBoyNoisy);
"____Finished Problem 3.3____";
ifftBoyNoisyIm = ifftshift(boyNoisyAfterReplace);
ifftBoyNoisyIm = ifft2(ifftBoyNoisyIm);
ifftBoyNoisyIm = uint8(real(ifftBoyNoisyIm));

figure();
subplot(1,2,1)
imshow(boyNoisyIm)
title('Original Image')

subplot(1,2,2);
imshow(ifftBoyNoisyIm);
title('Resultant Image');
pause;
disp("I think(noise -sin,cosin) noise will be removed when we remove highest frequency values ");
figure();
findFrequencies = [2,3,5,6];
for i=1:length(findFrequencies)
    mxIndex = findFreq(magnitudes(:),findFrequencies(i));
    FilterCon_M = FilterCon(fftCenterBoyNoisyIm, mxIndex);
    transFormedImg = ifftshift(FilterCon_M);
    newImage = ifft2(transFormedImg);
    subplot(2,2,i);
    imshow(uint8(newImage));
    title("image"+i);
end
pause;
disp('image 1,2,3,4 : removed diagonal lines by removing data, increased the luminance on the face');
disp('by filtering(average filter) on max frequency');
"____Finished Problem 3.4____";

lenaImg = imread("Lena.jpg");
L = wmaxlev(size(lenaImg),'db2');
[C,S]=wavedec2(lenaImg,L,'db2');
newLenaImg= waverec2(C,S,'db2');
newLenaImg=uint8(newLenaImg);
if lenaImg == newLenaImg
    disp("Both Images are Same");
else
    disp("Both Images are not same");
end
pause;

"____Finished Problem 4.1____";
[C,S] = wavedec2(lenaImg,3,'db2');
newC = C;newSize = S(1,1:2);
approximation = newC(1:newSize(1)*newSize(2));
approximation = reshape(approximation,newSize);
for i = 1:2:newSize(1)
    for j = 1:2:newSize(2)
        approximation(i:i+1,j:j+1) = mean(mean(approximation(i:i+1,j:j+1)));
    end
end
approximation = approximation(:);
approximation = approximation';
newC(1:newSize(1)*newSize(2)) = approximation;
newlenaImg1 = waverec2(newC,S,'db2');
newlenaImg1 = uint8(newlenaImg1);



newCLH = C;sizeLH = S(4,1:2);
startElementLH = (sizeLH(1)*sizeLH(2)*2) + 1;
endElementLH = sizeLH(1)*sizeLH(2)*3;

for i = startElementLH:endElementLH
    newCLH(1,i) = 0;
end

newlenaImg2 = waverec2(newCLH,S,'db2');
newlenaImg2 = uint8(newlenaImg2);



newCHL = C;sizeHL = S(2,1:2);
startElementHL = sizeHL(1)*sizeHL(2)+1;
endElementHL = sizeHL(1)*sizeHL(2)*2;
for i = startElementHL:endElementHL
    newCHL(1,i) = 0;
end

newlenaImg3 = waverec2(newCHL,S,'db2');
newlenaImg3 = uint8(newlenaImg3);

figure();
imshow(newlenaImg1);
title('image a');
pause;

figure();
imshow(newlenaImg2)
title('image b')
pause;

figure();
imshow(newlenaImg3)
title('image c')
pause;

"____Finished Problem 4.2____";
disp(" image a : blurred images because we are averaging intensity values of 2 X 2 block");
disp(" image b : setting vertical co-efficent 0's(LH1 part), little difference with original image, I think impact is less in first level ");
disp("image c : making HH3 part 0's image is blurred, diagonal information is lost, more impact in third level");
disp("Conclusion: more impact when we go to the higher level")

"____Finished Problem 4.3____";
lenaIm = imread('Lena.jpg');
lenaImNoise = imnoise(lenaIm,'gaussian',0,0.01);
"____Finished Problem 5.1____";
[C,S] = wavedec2(lenaImNoise,3,'db2');
"____Finished Problem 5.2____";
newVect = C;
newVect1 = threshold(newVect,S,1);
"____Finished Problem 5.3-5.7 first level____";
newVect2 = threshold(newVect1,S,2);
"____Finished Problem 5.3-5.7 second level____";
newVect3 = threshold(newVect2,S,3);
"____Finished Problem 5.3-5.7 third level____";
% reconstructing image using waverec
lenaDenoisedIm = waverec2(newVect3,S,'db2');
"____Finished Problem 5.8____";
lenaDenoisedIm = uint8(lenaDenoisedIm);
figure();
subplot(1,3,1);
imshow(lenaIm);
title('Original Image');

subplot(1,3,2);
imshow(lenaImNoise);
title('Noise Image');

subplot(1,3,3);
imshow(lenaDenoisedIm);
title('Noise Removed Image');
pause;
"____Finished Problem 5.9____";
clear all;
close all;