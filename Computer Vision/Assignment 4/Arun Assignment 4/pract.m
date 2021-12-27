lenaImg = imread("Lena.jpg");
[C,S] = wavedec2(lenaImg,3,'db2');
newC1 = C;
approxSize = S(1,1:2);
approximation = newC1(1:approxSize(1)*approxSize(2));
approximation = reshape(approximation,approxSize);
for m = 1:2:approxSize(1)
    for n = 1:2:approxSize(2)
     approximation(m:m+1,n:n+1) = mean(approximation(m:m+1,n:n+1));
    end
end
approximation = approximation(:);
approximation = approximation';
newC1(1:approxSize(1)*approxSize(2)) = approximation;
lenaNewIm1 = waverec2(newC1,S,'db2');
lenaNewIm1 = uint8(lenaNewIm1);

figure();
imshow(lenaNewIm1)
title('Reconstructed A');