function [auth, sigmat, sigind] = GenSig(share1,share2)
    
crap = size(share1);
crap(1) = crap(1)/2;
crap(2) = crap(2)/2;

auth = zeros(crap(1),crap(2));
fileID = fopen('gensig.txt','w');

bleh = crap(1)*crap(2);
sigmat = zeros(1,bleh);
k=1;
for i=1:crap(1)
    for j=1:crap(2)
        auth(i,j)=bitxor(share1(i+crap(1),j+crap(2)),share2((i),(j)));
        sigmat(k)=auth(i,j);
        k=k+1;
    end
end
%auth=~auth;

sigind = randperm(numel(sigmat));
sigmat = sigmat(sigind);

for i=1:bleh
    fprintf(fileID,'%d',sigmat(i));
end

%disp()
end