clc;
clear all;
close all;
A=imread('test.jpg');// use test1.jpg if not want to show match not found.
A=rgb2gray(A);
figure,imshow(A);
title('accepted image');
 
J=wiener2(A,[5 5]);
 
BW1=edge(J,'canny');
 
matched_data = 0;
white_points1 = 0;
black_points = 0;
count=0;
 
x=0;
y=0;
l=0;
m=0;
 
for a = 1:1:300
    for b = 1:1:300
        if(BW1(a,b)==1)
            white_points1 = white_points1+1;
        else
            black_points = black_points+1;
        end
    end
end
 
 srcFiles = dir('C:\Users\RAKESH KUMAR\Documents\MATLAB\*.jpg');  % the folder in which ur images exists
for i = 1 : 1 : length(srcFiles)
    filename = strcat('C:\Users\RAKESH KUMAR\Documents\MATLAB\db\',srcFiles(i).name);
    M = imread(filename);
    M=rgb2gray(M);
 
J1=wiener2(M,[5 5]);
 
 BW2=edge(J1,'canny');
 
white_points2 = 0;
black_points = 0;
count=count+1;
 
 
for a = 1:1:300
    for b = 1:1:300
        if(BW2(a,b)==1)
            white_points2 = white_points2+1;
        else
            black_points = black_points+1;
        end
    end
end
 
 total_matched_percentage = (white_points1/white_points2)*100;
 
 if(total_matched_percentage >= 75) 
    break;
end
 
end
if(total_matched_percentage >= 75) 
    display('MATCH FOUND');
    filename = strcat('C:\Users\RAKESH KUMAR\Documents\MATLAB\db\',srcFiles(i).name);
    M= imread(filename);
    M=rgb2gray(M);
    figure,imshow(M);
    title('MATCHED FROM DATABASE');
    

else
    display('MATCH NOT FOUND PLEASE TRY AGAIN');
end
   


