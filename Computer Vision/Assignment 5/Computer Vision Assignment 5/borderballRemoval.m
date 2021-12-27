function [outputImg,num] = borderballRemoval(ballImg,structureEle)
%balls that are not connected at the border
    [rowSize,colSize] = size(ballImg);
    borderBallImg = zeros(rowSize,colSize);
    borderBallImg(1,1:end) = ballImg(1,1:end);
    borderBallImg(rowSize,1:end) = ballImg(rowSize,1:end);
    borderBallImg(1:end,1) = ballImg(1:end,1);
    borderBallImg(1:end,colSize) = ballImg(1:end,colSize);
    img = ballImg;
    [imgrowSize,imgcolSize] = size(img);
    labelImg = zeros(size(img));
    num = 0;
    for i = 1:imgrowSize
        for j  = 1:imgcolSize
            if borderBallImg(i,j) == 1
                num= num + 1;
                dum = zeros(size(img));
                dum(i,j) = 1;
                dilation = imdilate(dum,structureEle);
                dumInt = dilation & img; 
                while(~isequal(dumInt,dum))
                    dum = dumInt;
                    dilation = imdilate(dum,structureEle);
                    dumInt = dilation & img;
                end
                dumIntOnes = find(dumInt == 1);
                img(dumIntOnes) = 0;
                borderBallImg(dumIntOnes) = 0;
                labelImg(dumIntOnes) = num;
            end
        end
    end
    outputImg = ballImg - labelImg;
end

