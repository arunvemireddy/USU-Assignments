function [filteredIm] = MedianFiltering(image,mask)
     [a,b] = size (mask);
    bool = false;
    if rem(a,2) == 0 || rem(b,2) == 0
        disp('mask dimensions are not odd')
    elseif a ~= b
        disp('mask is not a square')
    elseif sum(sum(mask<0)) > 0
        disp('mask does not satisfy the averaging filter properties')
    else
        bool = true;
    end
    if (bool == true)
       paddedIm = double(padarray(image,[(a-1)/2 (b-1)/2],0));
        filteredIm = paddedIm;
        [prowSize,pcolSize] = size(paddedIm);
        rowStart = 1+(a-1)/2;
        rowEnd = prowSize - (b-1)/2;
        colStart = 1+(b-1)/2;
        colEnd = pcolSize - (a-1)/2;
        for i = rowStart : rowEnd
            for j = colStart : colEnd
                paddedImSubMatrixRowStart = i - (a-1)/2;
                paddedImSubMatrixRowEnd = i + (a-1)/2;
                paddedImSubMatrixColStart = j - (b-1)/2;
                paddedImSubMatrixColEnd = j + (b-1)/2;
                paddedImSubMatrix = paddedIm(paddedImSubMatrixRowStart:paddedImSubMatrixRowEnd,paddedImSubMatrixColStart:paddedImSubMatrixColEnd);
                medianArray = zeros(round(sum(mask(:))),1);
                mask = mask(:);
                paddedImSubMatrix = paddedImSubMatrix(:);
                k = 1;
                for m = 1:size(mask)
                    for n = 1:mask(m)
                        medianArray(k) = paddedImSubMatrix(m);
                        k = k + 1;
                    end
                end
                value = median (medianArray);
                filteredIm(i,j) = value;
            end
        end
        filteredIm = uint8(filteredIm(rowStart : rowEnd,colStart : colEnd)); 
    end
end
