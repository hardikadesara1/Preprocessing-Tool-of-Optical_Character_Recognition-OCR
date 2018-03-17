function final=OCRMAIN()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

clc;
clear;
addpath(genpath(pwd));
cur_dir=pwd;

doc_path=strcat(cur_dir,'\Document_image');
mkdir(cur_dir,'\Output\Bwimage');
bwimage_path=strcat(cur_dir,'\Output\Bwimage');



Binarization(doc_path,bwimage_path);



mkdir(cur_dir,'\Output\Lines');
lines_path=strcat(cur_dir,'\Output\Lines');



LineSegment(bwimage_path,lines_path);



mkdir(cur_dir,'\Output\Words');
words_path=strcat(cur_dir,'\Output\Words');



mkdir(cur_dir,'\Output\Zones');
zone_path=strcat(cur_dir,'\Output\Zones');


mkdir(cur_dir,'\Output\Alignment_of_Zone');
Alig_Zone_path=strcat(cur_dir,'\Output\Alignment_of_Zone');


WordSegment(lines_path,words_path,zone_path,Alig_Zone_path);















% 
% imfolder=uigetdir;
% opfolder=uigetdir;
% totalim=21;
% 
% for i=1:totalim
%     
% getim=strcat(imfolder,'\',num2str(i),'.tif'); 
% orgimg=imread(getim);
% 
% fullpathopfol=strcat(opfolder,'\Image_',num2str(i));
% mkdir(fullpathopfol);
% 
% invimg=binarization(orgimg);
% lines=linesegment(invimg);
% wordsegment();
% 
% 
% 
% imshow(lines);
% end











end

