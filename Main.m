clc;
clear all;
close all;

inImg = imread('girl.bmp');
figure;imshow(inImg);title('Secret Image');

[share1, share2, result, index] = MakeShare(inImg);

figure;imshow(share1);title('Share 1');
figure;imshow(share2);title('Share 2');
figure;imshow(result);title('Superimposing Share 1 & 2');


imwrite(share1,'Share1.bmp');
imwrite(share2,'Share2.bmp');
imwrite(result,'Result.bmp');


disp('Extracting Confidential Data...');

extracted = exarr(share1, share2);
extracted(index) = extracted;

fileID = fopen('afterdecrypt.txt','w');
sz=size(extracted);
len = sz(2);
for i=1:len
    fprintf(fileID,'%d',extracted(i));
end
fclose(fileID);

disp('Data Stored in file afterdecrypt.txt');

disp('Generating Signature');
[auth, sigmat, sigind]=GenSig(share1,share2);

figure;imshow(auth);title('Authentication');
imwrite(auth,'Authentication.bmp')
disp('Signature stored in signature.txt')

disp('Verifying signature...')
VerSig(auth,sigind);
