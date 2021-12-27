function [minpixCount] = pixCount(inputImg)
   structureEle = strel('square',3);
   [imgrowSize,imgcolSize] = size(inputImg);
   minpixCount = imgrowSize*imgcolSize;
    for i = 1:imgrowSize
        for j  = 1:imgcolSize
            if inputImg(i,j) == 1
                dum = zeros(size(inputImg));
                dum(i,j) = 1;
                dilation = imdilate(dum,structureEle);
                intersectDum = dilation & inputImg; 
                while(~isequal(intersectDum,dum))
                    dum = intersectDum;
                    dilation = imdilate(dum,structureEle);
                    intersectDum = dilation & inputImg;
                end
                intersectDumOnes = find(intersectDum == 1);
                count = length(intersectDumOnes);
                if (count < minpixCount)
                    minpixCount = count;
                end
                inputImg(intersectDumOnes) = 0;
            end
        end
    end 
end

