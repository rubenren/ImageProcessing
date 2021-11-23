img = imread("onion.png");

img = double(img);

rows = size(img,1);
cols = size(img,2);

k = 4; % change this to set k for k-means
T = 2;
N = 100;

% specify random set of means
initMeans = cell(k,1);
for i = 1:k
    initMeans{i} = squeeze(img(randperm(rows,1), randperm(cols,1), :));
end



means = initMeans;
for t = 1:N
    
    clusters = cell(k,2);
    
    % assign each pixel to closest mean
    for x = 1:rows
        for y = 1:cols
            pixVal = squeeze(img(x,y, :));
            distances = [];
            for i = 1:k
                distances = [distances norm(pixVal - means{i})];
            end
            [~, idx] = min(distances);
            clusters{idx,1} = [clusters{idx,1} [x y]'];
            clusters{idx,2} = [clusters{idx,2} pixVal];
        end
    end

    % now we update the cluster means
    prevMeans = means;
    for i = 1:k
        means{i} = mean(clusters{i,2},2);
    end

    % now we test for convergence
    theSum = 0;
    for i = 1:k
        theSum = theSum + norm(means{i} - prevMeans{i});
    end

    if theSum <= T
        break;
    end
end

outImg = img;

for i = 1:k
    for j = 1:size(clusters{i,1},2)
        outImg(clusters{i,1}(1,j), clusters{i,1}(2,j),:) = means{i};
    end
end

caption = sprintf('Threshold = %d\nIteration:%d Means:%d',...
    T,t,k);
subplot(1,2,1), imshow(uint8(outImg)), title(caption);
subplot(1,2,2), imshow(uint8(img));