clear all;
close all
clc
[file1,path1,~]=uigetfile('*.png; *.jpg; *.jpeg'); % select a file from drive
if isequal(file1,0)
   disp('User selected Cancel')     % if user cancel selection
else
   disp(['User selected ', fullfile(path1, file1)]) %else if user makes a file selection
end
im=imread(horzcat(path1,file1));        %Reading the image
img=double(rgb2gray(im));       %taking float value of image data
[m,n]=size(img);            % taking the size of image
initial_value=1.8;     %the initial value in which I will vary my kernel size relative to image
end_value=20;       %the end value in which I will vary y kernel size relative to image
scale_space=6;      %the scale space steps to take
sigma = 1.5; %value of standard deviation to be input as seen in Harris blob detector
%sigma=1; %2; %3; %4; %;5 %6; %7 ; % differet sigma test runs
tic                 %to start counting clock for speed of algo
[coordx,coordy,radii]=blobdetect(img,sigma,initial_value,end_value,scale_space);    %blobdetect function to find blobs
app=[];         %empty array to save blobs x and y coordinates
imshow(im); hold on;            %display image
app(:,1)=coordx;            
app(:,2)=coordy;
radii=fix(n*radii*0.5);
viscircles(app,radii,'Color','r','LineWidth',1.5);  %draw circle function
toc                    % stop the counting clock
