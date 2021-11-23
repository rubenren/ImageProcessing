img = double(imread('cameraman.tif'));

ps = [.25 .5 .9 .95];

wvlts = ["haar" "db3" "bior1.1"];
for p = ps
    idx = 1;
    figure;
    annotation('textbox', [0 .95 1 .05], 'String', p);
    for wvlt = wvlts
        [c1A, c1H, c1V, c1D] = dwt2(img,wvlt);
        [c2A, c2H, c2V, c2D] = dwt2(c1A,wvlt);

        % Keep only a certain percent of detail coeffs

        % for first horizontal
        rows = size(c1H,1);
        cols = size(c1H,2);
        temp = reshape(c1H,1,[]);
        [~, inds] = sort(reshape(abs(c1H),1,[]));
        dropUpTo = uint64(rows*cols*p);
        temp(inds(1:dropUpTo)) = 0;
        c1H = reshape(temp, rows, cols);

        % for first vertical
        temp = reshape(c1V,1,[]);
        [~, inds] = sort(reshape(abs(c1V),1,[]));
        dropUpTo = uint64(rows*cols*p);
        temp(inds(1:dropUpTo)) = 0;
        c1V = reshape(temp, rows, cols);

        % for first diagonal
        temp = reshape(c1D,1,[]);
        [~, inds] = sort(reshape(abs(c1D),1,[]));
        dropUpTo = uint64(rows*cols*p);
        temp(inds(1:dropUpTo)) = 0;
        c1D = reshape(temp, rows, cols);

        % for second horizontal
        rows = size(c2H,1);
        cols = size(c2H,2);
        temp = reshape(c2H,1,[]);
        [~, inds] = sort(reshape(abs(c2H),1,[]));
        dropUpTo = uint64(rows*cols*p);
        temp(inds(1:dropUpTo)) = 0;
        c2H = reshape(temp, rows, cols);

        % for second vertical
        temp = reshape(c2V,1,[]);
        [~, inds] = sort(reshape(abs(c2V),1,[]));
        dropUpTo = uint64(rows*cols*p);
        temp(inds(1:dropUpTo)) = 0;
        c2V = reshape(temp, rows, cols);

        % for second diagonal
        temp = reshape(c2D,1,[]);
        [~, inds] = sort(reshape(abs(c2D),1,[]));
        dropUpTo = uint64(rows*cols*p);
        temp(inds(1:dropUpTo)) = 0;
        c2D = reshape(temp, rows, cols);

        c1A = idwt2(c2A, c2H, c2V, c2D, wvlt);
        reconstruction = idwt2(c1A, c1H, c1V, c1D, wvlt);
        
        errorImg = reconstruction - img;
        rmse = (sum(errorImg.^2,'all')/(size(errorImg,1)*size(errorImg,2)))^.5;

        subplot(2,3,idx), imshow(uint8(reconstruction)), title(wvlt + ":");
        subplot(2,3,idx+3), imshow(rescale(errorImg)), colorbar, title(rmse + ":");
        idx = idx + 1;
    end
end
