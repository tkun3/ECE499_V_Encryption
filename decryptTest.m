t1=cputime;
%Extract the information
%image3 = imread('DarkImages/bg16by6.png');
%tThresStart=cputime;
%outThreshold = threshold(image3);
%tThresEnd=(cputime-tThresStart)/10;
%imageOut3 = extract(image3,6,6,outThreshold);

%Read Image-----------------------------
%image3 = imread('jgs/jgs1.png');
%Find Image Green Threshold Value
%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,6,6,outThreshold);


%Read Image-----------------------------
%image3 = imread('jgs/jgs.png');
%Find Image Green Threshold Value
%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,10,10);


%Read Image-----------------------------
%image3 = imread('DecryptionTestImages/jay10by10.png');
%Find Image Green Threshold Value
%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,10,10,outThreshold);

%Read Image-----------------------------
%image3 = imread('DecryptionTestImages/jay10by10.png');
%Find Image Green Threshold Value
%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,10,10,outThreshold)

%Read Image-----------------------------
%image3 = imread('output/1.png');
%Find Image Green Threshold Value
%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,5,5,outThreshold);

%image3 = imread('TestPhotos/appleFS.jpg');
%good
%image3 = imread('DecryptionTestImages/jay10by10.png');
%good
%image3 = imread('TestPhotos/appleGrey8by8Crop.jpg');
%good
%image3 = imread('TestPhotos/apple8by8.jpg');
%good
%image3 = imread('TestPhotos/apple16by16.png');
%good
%image3 = imread('TestPhotos/apple32by321.png');

%good
%variance 35 - 40
%image3 = imread('TestPhotos/railroad27by27LOW.jpg');

%good
%image3 = imread('TestPhotos/apple32by321.png');

%okay
%image3 = imread('TestPhotos/apple8by8enc2.jpg');

%good
%image3 = imread('DecryptionTestImages/jay10by10.png');

%image3 = imread('output/1.png');

image3 = imread('~/Desktop/TestCases/TestImages/40by40.jpg');
x = 40;
y = 40;
variance = 15;
bias = 0;

%image3 = imread('output/1.png');

%image3 = crop(image3);


%figure('Name','Cropped Image');
%imshow(image3);
%image3 = imread('TestPhotos/railroad27by27.jpg');
%image3 = imgaussfilt(image3,0.3);
%image3 = imread('output/1.png');
%Find Image Green Threshold Value

%outThreshold = threshold(image3);
%image3 = imsharpen(image3);
%image3 = imgaussfilt(image3,0.7);

%figure('Name','Encrypted Image')
%imshow(image3);
%Extract Data------------------------------------------

imageOut3 = extract_B(image3,x,y,variance,bias);


%outThreshold = threshold(image3);
%imageOut3 = extract(image3,x,y,outThreshold);

%outThreshold = threshold_EUC(image3);
%imageOut3 = extract_EUC(image3,x,y,outThreshold);

%-------------------------------------------------------

%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,5,5,outThreshold);

%Read Image-----------------------------
%image3 = imread('TestPhotos/j5by5.jpg');
%Find Image Green Threshold Value
%outThreshold = threshold(image3);
%Extract Data
%imageOut3 = extract(image3,5,5,outThreshold);


%figure('Name','Encrypted Image')
%imshow(image3);

%figure
%imshow(imageOut3{15});

%for i = 1:length(imageOut3)
%    figure
%    imshow(imageOut3{i});
%end


%Normalize Data-----------------------------
imageOut3 = normalization(imageOut3);

%Decrypt Image-----------------------------

dImage = decrypt(imageOut3,x,y);
imwrite(dImage,'outputDecry/1D.jpg');
decryptTestTime=(cputime-t1);

%figure('Name','Decrypted Image')
%imshow(dImage);

