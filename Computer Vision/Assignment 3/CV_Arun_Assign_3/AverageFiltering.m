function [filteredIm] = AverageFiltering(im,mask)
[row,col]=size(im);
[a,b]=size(mask);

if (a~=b)
    disp("invalid mask,rows and columsns are not equal")
end

for i = 1:a
    for j=1:b
       if(im(i,j)<0)
           disp("invalid mask,  mask intensity values cannot be nagative");
           return
       end
    end
end
summ=0;
for i = 1:a
    for j=1:b
       summ=summ+mask(i,j);
    end
end

if(round(summ)~=1)
    disp("invalid mask, sum of all elements should be one");
    return
end

if (mod(a,2)==0 || mod(b,2)==0)
    disp('invalid mask, mask should have odd number of rows and colums');
    return
end

if (mask~=mask')
    disp('invalid mask, mask should be symmetrical');
    return
end


 paddedIm = double(padarray(im,[(a-1)/2 (b-1)/2],0));
        filteredIm = paddedIm;
        [paddedImRowSize,paddedImColSize] = size(paddedIm);
        rowStart = 1+(a-1)/2;
        rowEnd = paddedImRowSize - (b-1)/2;
        colStart = 1+(b-1)/2;
        colEnd = paddedImColSize - (a-1)/2;
        for i = rowStart : rowEnd
            for j = colStart : colEnd
                paddedImSubMatrixRowStart = i - (a-1)/2;
                paddedImSubMatrixRowEnd = i + (a-1)/2;
                paddedImSubMatrixColStart = j - (b-1)/2;
                paddedImSubMatrixColEnd = j + (b-1)/2;
                paddedImSubMatrix = paddedIm(paddedImSubMatrixRowStart:paddedImSubMatrixRowEnd,paddedImSubMatrixColStart:paddedImSubMatrixColEnd);
                value = sum(sum(paddedImSubMatrix.*mask));
                filteredIm(i,j) = value;
            end
        end
        filteredIm = uint8(filteredIm(rowStart : rowEnd,colStart : colEnd));
end

