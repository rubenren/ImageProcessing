img = double(imread('cameraman.tif'));

% Create the basis images

% Attempt at vectorization
global basisDim
basisDim = 8;
a_uMat = (ones(basisDim,1)*(2/basisDim)^.5);
a_uMat(1) = (1/basisDim)^.5;
a_vMat = a_uMat';

global basisIms
basisIms = zeros(8,8,8,8);

xs = 0:basisDim-1;
us = 0:basisDim-1;
firstCosMat = cos((2*xs+1)'*us*pi/(2*basisDim));

ys = 0:basisDim-1;
vs = 0:basisDim-1;
secondCosMat = cos((2*ys+1)'*vs*pi/(2*basisDim));

for u = 0:basisDim-1
    for v = 0:basisDim-1
        basisIms(:,:,u+1,v+1) = a_uMat(u+1)*a_vMat(v+1)*firstCosMat(:,u+1)*secondCosMat(:,v+1)';
    end
end

%figure, imshow(basisIms(:,:,2,2));
%figure, imshow(basisIms(:,:,5,5));
%figure, imshow(basisIms(:,:,2,8));

maxes = [32 16 8 4 2];
global nMax;

for nMax = maxes
    funcHandle = @myFilter;
    procImg = blockproc(img, [basisDim basisDim], funcHandle);

    reducHandle = @myReducer;
    procImg = blockproc(procImg, [basisDim basisDim], reducHandle);

    funcHandle = @myInversion;
    procImg = blockproc(procImg, [basisDim basisDim], funcHandle);
    
    errorImg = procImg - img;
    rmse = (sum(errorImg.^2,'all')/(size(errorImg,1)*size(errorImg,2)))^.5;
    
    figure, subplot(1,2,1), imshow(uint8(procImg)), title("keeping top " + nMax);
    subplot(1,2,2), imshow(rescale(errorImg)), colorbar, title("error: " + rmse);
    
end

function retVal = myFilter(blockStruct)
    global basisDim;
    global basisIms;
    retVal = zeros(size(blockStruct.data));
    for u = 1:basisDim
        for v = 1:basisDim
            retVal(u,v) = sum(blockStruct.data.*basisIms(:,:,u,v),'all');
        end
    end
    
    
    
end

function retVal = myInversion(blockStruct)
    global basisDim;
    global basisIms;
    retVal = zeros(size(blockStruct.data));
    for x = 1:basisDim
        for y = 1:basisDim
            temp = squeeze(basisIms(x,y,:,:));
            retVal(x,y) = sum(blockStruct.data.*temp,'all');
        end
    end
    
    
    
end

function retVal = myReducer(blockStruct)
    global basisDim;
    global nMax;
    
    % Keep only n greatest mag coeffs
    retVal = blockStruct.data;
    temp = reshape(retVal,1,[]);
    [toss inds] = sort(reshape(abs(retVal),1,[]));
    temp(inds(1:basisDim^2 - nMax)) = 0;
    retVal = reshape(temp, basisDim, basisDim);
end



%forwardTFunc = @(block_struct) basisIms*block_struct.data*basisIms';

%transformed = blockproc(img, [8 8], forwardTFunc);