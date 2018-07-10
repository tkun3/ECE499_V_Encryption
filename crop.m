function [outImage] = crop(inputImage)
%CROP function used as preprocessing step to remove all non-green
%pixels surrounding the image


[rows columns depth] = size(inputImage);


xmin = 0;
xmax = 0;
ymin = 0;
ymax = 0;


%find left x
for j = 1:columns - 1
    
    r = inputImage(round(rows/2),j,1);
    g = inputImage(round(rows/2),j,2);
    b = inputImage(round(rows/2),j,3);
    
    if(r <= 50 && g >= 200 && b <= 50)
        xmin = j;
        break
    end
    
end


%find right x

for j = columns:-1:1
    
    r = inputImage(round(rows/2),j,1);
    g = inputImage(round(rows/2),j,2);
    b = inputImage(round(rows/2),j,3);
    
    if(r <= 50 && g >= 200 && b <= 50)
        xmax = j;
        break
    end
    
end


%find top y

for i = 1:rows-1
    
    r = inputImage(i,round(columns/2),1);
    g = inputImage(i,round(columns/2),2);
    b = inputImage(i,round(columns/2),3);
    
    if(r <= 50 && g >= 200 && b <= 50)
        ymin = i;
        break
    end
    
end


%find bottom y

for i = rows:-1:1
    
    r = inputImage(i,round(columns/2),1);
    g = inputImage(i,round(columns/2),2);
    b = inputImage(i,round(columns/2),3);
    
    if(r <= 50 && g >= 200 && b <= 50)
        ymax = i;
        break
    end
    
end

%[xmin ymin width height]
rect = [xmin ymin xmax-xmin ymax-ymin]



outImage = imcrop(inputImage,rect);

figure('Name','Input Image')
imshow(inputImage);

figure('Name','Output Image')
imshow(outImage);



end

