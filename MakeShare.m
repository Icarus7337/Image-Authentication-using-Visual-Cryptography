function [share1, share2, result, index, auth] = MakeShare(inImg)

fund1 = ~[1 1;0 0];
fund2 = ~[0 0;1 1];
fund3 = ~[1 0;1 0];
fund4 = ~[0 1;0 1];
fund5 = ~[1 0;0 1];
fund6 = ~[0 1;1 0];

crap = size(inImg);
len=crap(1)*crap(2);

mat = zeros(2,len);

count=1;
if (mod(len,2)==1)
    len=len-1;
end    
confarr = zeros(1,len/2);

fileID = fopen('beforeencrypt.txt','w');

for i=1:len/2
    confarr(i) = floor(6*rand(1));
    fprintf(fileID,'%d',confarr(i));
end
fclose(fileID);

%disp(confarr);
index = randperm(numel(confarr));
confarr = confarr(index);

j=1;
for i=1:len/2
    num = confarr(1,j);
    [x, y] = genxy(num);
    mat(1,(2*i)-1)=x;
    mat(2,(2*i))=y;
    j=j+1;
end   
%disp (mat);
k=1;
for i=1:crap(1)
    
    for j=1:crap(2)
        
        if (inImg(i,j)==1)
           if(mod(k,2)==1)
               mat(2,k)=mat(1,k);
           else
               mat(1,k)=mat(2,k);
           end
           
        elseif (inImg(i,j)==0)
            if (mod(k,2)==1)
                if(mod(mat(1,k),2)==0)
                    mat(2,k)=mat(1,k)+1;
                    
                elseif(mod(mat(1,k),2)==1)
                    mat(2,k)=mat(1,k)-1;
                end
                
            elseif (mod(k,2)==0)
                if(mod(mat(2,k),2)==0)
                    mat(1,k)=mat(2,k)+1;
                    
                elseif(mod(mat(2,k),2)==1)
                    mat(1,k)=mat(2,k)-1;
                end
            end
        end
        k=k+1;    
    end
end

%disp(mat);

share1 = zeros(2*crap(1),2*crap(2));
share2 = zeros(2*crap(1),2*crap(2));
k=1;
for i=1:crap(1)
    
    for j=1:crap(2)
        
        if(mat(1,k)==0)
            share1((2*i-1):(2*i),(2*j-1):(2*j)) = fund1;
        elseif(mat(1,k)==1)
            share1((2*i-1):(2*i),(2*j-1):(2*j)) = fund2;
        elseif(mat(1,k)==2)
            share1((2*i-1):(2*i),(2*j-1):(2*j)) = fund3;
        elseif(mat(1,k)==3)
            share1((2*i-1):(2*i),(2*j-1):(2*j)) = fund4;
        elseif(mat(1,k)==4)
            share1((2*i-1):(2*i),(2*j-1):(2*j)) = fund5;
        elseif(mat(1,k)==5)
            share1((2*i-1):(2*i),(2*j-1):(2*j)) = fund6;
        end
        
        if(mat(2,k)==0)
            share2((2*i-1):(2*i),(2*j-1):(2*j)) = fund1;
        elseif(mat(2,k)==1)
            share2((2*i-1):(2*i),(2*j-1):(2*j)) = fund2;
        elseif(mat(2,k)==2)
            share2((2*i-1):(2*i),(2*j-1):(2*j)) = fund3;
        elseif(mat(2,k)==3)
            share2((2*i-1):(2*i),(2*j-1):(2*j)) = fund4;
        elseif(mat(2,k)==4)
            share2((2*i-1):(2*i),(2*j-1):(2*j)) = fund5;
        elseif(mat(2,k)==5)
            share2((2*i-1):(2*i),(2*j-1):(2*j)) = fund6;
        end
             
        k=k+1;
    end
end

result=bitxor(share1, share2);
result = ~result;