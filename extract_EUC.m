%Function Used to extract the data inside of the green grid in order to
%decode and process as necessary for the purpose of encryption / decryption
%Written by: Takuma Pimlott, James Wong
%CENG 499

function [outImage] = extract_EUC(inputImage, rowCount, colCount, outThreshold)

%Extract blocks from the grid
%1)Takes in parameters of the original input image
%2)rowCount is the number of horizontal pseudo pixels
%3)colCount is the number of vertical pseudo pixels

[rows columns depth] = size(inputImage);






%Scan the image row by row pixels and recreate the cell contents in cells

z = 20;

%colIncrements = round(rows/(2*colCount));
%rowIncrements = round(columns/(2*rowCount));

rowIncrements = round(rows/(2*rowCount));
colIncrements = round(columns/(2*colCount));


tempOut = cell(1,0);

firstIncrement = round((rows/rowCount)/2.5);


rowFirst = 1;
colFirst = 1;


%Find the thresholding values to use

%RGB Method
%R = outThreshold(1);
%G = outThreshold(2);
%B = outThreshold(3);

%LAB COLOR METHOD
Aavg = outThreshold(1);
Bavg = outThreshold(2);

%Set the Z pixel size ie pseudo pixel z*z size
z = rows/(2*rowCount);
step = round(z*0.6);

EUC_Range = 20;
bias = 4;

%Find ranges for each pseudo pixel
for i = rowIncrements:(rowIncrements*2):rows
    
   for j = colIncrements:(colIncrements*2):columns

       %find horizontal bounds
       %find left bound
       dec = step;
       X1 = i;
       lab1 = rgb2lab(inputImage(i-dec,j,:));
       lab1A = lab1(1,1,2) - Aavg;
       lab1B = lab1(1,1,3) - Bavg;
       lab1Distance = (lab1A^2 + lab1B^2)^.5;
       while  lab1Distance > EUC_Range %&& inputImage(i-dec,j,1) > R && inputImage(i-dec,j,3) > B
           dec = dec + 1;
           X1 = i - dec;
           
           lab1 = rgb2lab(inputImage(i-dec,j,:));
           lab1A = lab1(1,1,2) - Aavg;
           lab1B = lab1(1,1,3) - Bavg;
           lab1Distance = (lab1A^2 + lab1B^2)^.5;
           
       end
       
       X1 = X1 + bias;

       %find right bound
       inc = step;
       X2 = i;
       
       lab2 = rgb2lab(inputImage(i+inc,j,:));
       lab2A = lab2(1,1,2) - Aavg;
       lab2B = lab2(1,1,3) - Bavg;
       lab2Distance = (lab2A^2 + lab2B^2)^.5;
       
       while lab2Distance > EUC_Range %&& inputImage(i+inc,j,1) > R && inputImage(i+inc,j,3) > B
           inc = inc + 1;
           X2 = i + inc;
           
           lab2 = rgb2lab(inputImage(i+inc,j,:));
           lab2A = lab2(1,1,2) - Aavg;
           lab2B = lab2(1,1,3) - Bavg;
           lab2Distance = (lab2A^2 + lab2B^2)^.5;
       end
       
       X2 = X2 - bias;
       
       %horizontal range will be from X1 to X2;



       %find vertical bounds
       %find top bound
       dec = step;
       Y1 = j;
       
       lab3 = rgb2lab(inputImage(i,j-dec,:));
       lab3A = lab3(1,1,2) - Aavg;
       lab3B = lab3(1,1,3) - Bavg;
       lab3Distance = (lab3A^2 + lab3B^2)^.5;
       
       while lab3Distance > EUC_Range %&& inputImage(i,j-dec,1) > R && inputImage(i,j-dec,3) > B
           dec = dec + 1;
           Y1 = j - dec;
           
           lab3 = rgb2lab(inputImage(i,j-dec,:));
           lab3A = lab3(1,1,2) - Aavg;
           lab3B = lab3(1,1,3) - Bavg;
           lab3Distance = (lab3A^2 + lab3B^2)^.5;
       end
       
       Y1 = Y1 + bias;

       %find bottom bound
       inc = step;
       Y2 = j;
       
       lab4 = rgb2lab(inputImage(i,j+inc,:));
       lab4A = lab4(1,1,2) - Aavg;
       lab4B = lab4(1,1,3) - Bavg;
       lab4Distance = (lab4A^2 + lab4B^2)^.5;
       
       
       while lab4Distance > EUC_Range %&& inputImage(i,j+inc,1) > R && inputImage(i,j+inc,3) > B
           inc = inc + 1;
           Y2 = j + inc;
           
           lab4 = rgb2lab(inputImage(i,j+inc,:));
           lab4A = lab4(1,1,2) - Aavg;
           lab4B = lab4(1,1,3) - Bavg;
           lab4Distance = (lab4A^2 + lab4B^2)^.5;
       end
       
       Y2 = Y2 - bias;
       
       r = inputImage(X1:X2, Y1:Y2,1);
       g = inputImage(X1:X2, Y1:Y2,2);
       b = inputImage(X1:X2, Y1:Y2,3);
       pseudoPixel = cat(3, r, g, b);
       tempOut{end+1} = pseudoPixel;
       
       
   end
end




%output image is equal to some kind of cell
outImage =  tempOut;

end

