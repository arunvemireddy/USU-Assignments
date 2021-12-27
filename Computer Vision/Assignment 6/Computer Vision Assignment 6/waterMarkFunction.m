function [outputImg] = waterMarkFunction(inputImg,randomImg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[row,col] = size(randomImg);
b=30;
for i = 1:row
    for j = 1 : col
        if(randomImg(i,j)==1 && mod(inputImg(i,j),b)>= (0.25*b))
            inputImg(i,j)= inputImg(i,j)- mod(inputImg(i,j),b)+(0.75*b);
        end
        if(randomImg(i,j)==1 && mod(inputImg(i,j),b)< (0.25*b) )
             inputImg(i,j)= (inputImg(i,j)-(0.25*b))-mod((inputImg(i,j)-(0.25*b)),b)+(0.75*b);
        end
        if(randomImg(i,j)==0 && mod(inputImg(i,j),b)<=(0.75*b))
            inputImg(i,j)=inputImg(i,j)-mod(inputImg(i,j),b)+0.25*b;
        end
        if(randomImg(i,j)==0 && mod(inputImg(i,j),b)>(0.75*b))
            inputImg(i,j)=(inputImg(i,j)+(0.5*b))-mod((inputImg(i,j)-(0.5*b)),b)+(0.25*b);
        end
    end
end
outputImg=inputImg;
end

