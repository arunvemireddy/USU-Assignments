function [outputArg1,outputArg2] = nonOverlapPixel(inputImg,pixelCount)
    fValue = 0.9;
    sValue = 1.1;
    [imRowSize,imColSize] = size(inputImg);
    outputArg1 = zeros(size(inputImg));
    % declare outputArg2 0 intitally
    outputArg2 = 0;
    structureEle = strel('square',3);
    for i = 1:imRowSize
        for j  = 1:imColSize
            if inputImg(i,j) == 1
                S= size(inputImg);
                dum = zeros(S);
                dum(i,j) = 1;
                dilateDum = imdilate(dum,structureEle);
                dumInt = dilateDum & inputImg; 
                while(~isequal(dum,dumInt))
                    dum = dumInt;
                    dilateDum = imdilate(dum,structureEle);
                    dumInt = dilateDum & inputImg;
                end
                dumIntOnes = find(dumInt == 1);
                inputImg(dumIntOnes) = 0;
                if pixelCount >= fValue*length(dumIntOnes) && pixelCount <= sValue*length(dumIntOnes) 
                    outputArg2 = outputArg2 + 1;
                    outputArg1(dumIntOnes) = outputArg2;
                end
            end
        end
    end
end

