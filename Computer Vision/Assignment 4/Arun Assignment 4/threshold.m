function [newVector] = threshold(newVector,l,waveletNumber)
    lSize = length(l);
    respRow = lSize - waveletNumber;
    respLevelWaveletSize = l(respRow,1:2);
    fij = newVector(1,respLevelWaveletSize(1)*respLevelWaveletSize(2)+1:respLevelWaveletSize(1)*respLevelWaveletSize(2)*4);
    noiseVariance = median(abs(fij))/(0.6745);
    MSize = respLevelWaveletSize;
    M = 3*MSize(1)*MSize(2);
    t = sqrt(noiseVariance*2*log(M));
    for i = respLevelWaveletSize(1)*respLevelWaveletSize(2)+1:respLevelWaveletSize(1)*respLevelWaveletSize(2)*4
        if (newVector(1,i) >= t)
            newVector(1,i) = newVector(1,i) - t;
        elseif (newVector(1,i) <= -t)
            newVector(1,i) = newVector(1,i) + t;
        elseif (abs(newVector(1,i)) < t)
            newVector(1,i) = 0;
        end
    end
end
