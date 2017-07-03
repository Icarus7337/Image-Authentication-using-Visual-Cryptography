function VerSig(auth,sigind)

crap = size(auth);
k=1;
junk = crap(1)*crap(2);
vermat = zeros(1,junk);

for i=1:crap(1)
    for j=1:crap(2)
        vermat(k)=auth(i,j);
        k=k+1;
    end
end
fileID = fopen('versig.txt','w');

vermat=vermat(sigind);

for i=1:junk
    fprintf(fileID,'%d',vermat(i));
end

end