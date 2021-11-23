f = ones(256,'double');
f(2,1) = 5;
f(1,1) = 5;
wv = 'haar';
[cfs,inds] = wavedec2(f,5,wv);

cfs1 = appcoef2(cfs,inds,wv,1);
cfs2 = appcoef2(cfs,inds,wv,2);
cfs3 = appcoef2(cfs,inds,wv,3);
cfs4 = appcoef2(cfs,inds,wv,4);
cfs5 = appcoef2(cfs,inds,wv,5);
