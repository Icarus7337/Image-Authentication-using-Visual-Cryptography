function extracted = exarr(share1, share2)

fund1 = ~[1 1;0 0];
fund2 = ~[0 0;1 1];
fund3 = ~[1 0;1 0];
fund4 = ~[0 1;0 1];
fund5 = ~[1 0;0 1];
fund6 = ~[0 1;1 0];

crap = size(share1);
crap(1) = crap(1)/2;
crap(2) = crap(2)/2;

len = crap(1)*crap(2);
if (mod(len,2)==0)
    extracted = zeros(1,len/2);
elseif (mod(len,2)==1)
    extracted = zeros (1,(len-1)/2);
end
mat = zeros(2,len);
k=1;
for i=1:crap(1)
    
    for j=1:crap(2)
        
        if(share1((2*i-1):(2*i),(2*j-1):(2*j)) == fund1)
            mat(1,k)=0;
        elseif(share1((2*i-1):(2*i),(2*j-1):(2*j)) == fund2)
            mat(1,k)=1;
        elseif(share1((2*i-1):(2*i),(2*j-1):(2*j)) == fund3)
            mat(1,k)=2;
        elseif(share1((2*i-1):(2*i),(2*j-1):(2*j)) == fund4)
            mat(1,k)=3;
        elseif(share1((2*i-1):(2*i),(2*j-1):(2*j)) == fund5)
            mat(1,k)=4;
        elseif(share1((2*i-1):(2*i),(2*j-1):(2*j)) == fund6)
            mat(1,k)=5;
        end
        
        if(share2((2*i-1):(2*i),(2*j-1):(2*j)) == fund1)
            mat(2,k)=0;
        elseif(share2((2*i-1):(2*i),(2*j-1):(2*j)) == fund2)
            mat(2,k)=1;
        elseif(share2((2*i-1):(2*i),(2*j-1):(2*j)) == fund3)
            mat(2,k)=2;
        elseif(share2((2*i-1):(2*i),(2*j-1):(2*j)) == fund4)
            mat(2,k)=3;
        elseif(share2((2*i-1):(2*i),(2*j-1):(2*j)) == fund5)
            mat(2,k)=4;
        elseif(share2((2*i-1):(2*i),(2*j-1):(2*j)) == fund6)
            mat(2,k)=5;
        end
              
        k=k+1;
    end
end

j=1;

for i=1:2:len-1
    extracted(j) = mod((mat(1,i)+mat(2,i+1)),6);
    j=j+1;
end

