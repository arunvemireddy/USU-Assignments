function [cleanedGrayScaleIm] = RemoveStreaks(oriIm)

    laplacianFilter = [1 1 1;1 -8 1; 1 1 1];
    value=3;
    value1=255;
    oriImEnhancedPixels = oriIm*value;
    oriImFiltered = imfilter(oriImEnhancedPixels,laplacianFilter,'conv');
    cleanedGrayScaleIm = value1 - oriImFiltered;
    
    figure();
    subplot(1,3,1)
    imshow(oriIm)
    title('Original Image')
    
    subplot(1,3,2)
    imshow(oriImFiltered)
    title('Laplacian Filter')
    
    subplot(1,3,3)
    imshow(cleanedGrayScaleIm)
    title('Cleaned Gray Scale Image')
end

