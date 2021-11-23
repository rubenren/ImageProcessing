inputImg = imread('testpat1.png');
rows = size(inputImg,1);
cols = size(inputImg,2);

P = rows*2;
Q = cols*2;

imgP = [inputImg; zeros(P - rows,cols)];
imgP = [imgP zeros(P,Q - cols)];

F = fft2(imgP);
F = fftshift(F);

D_list = [10 50 100];

figure, imshow(inputImg);

for D_0 = D_list
    H = zeros([P,Q],'like',F);

    for u = 1:P
        for v = 1:Q
            if sqrt((u - P/2)^2 + (v - Q/2)^2) <= D_0
                H(u,v) = 1 + 0j;
            end
        end
    end

    G = H .* F;
    G = ifftshift(G);
    gP = real(ifft2(G));
    g = uint8(gP(1:rows,1:cols));

    figure, imshow(g);
end

D_list = [10 50 100];

for D_0 = D_list
    H = zeros([P,Q],'like',F);

    for u = 1:P
        for v = 1:Q
            H(u,v) = exp(-((u - P/2)^2 + (v - Q/2)^2)/(2*(D_0)^2));
        end
    end

    G = H .* F;
    G = ifftshift(G);
    gP = real(ifft2(G));
    g = uint8(gP(1:rows,1:cols));

    figure, imshow(g);
end

