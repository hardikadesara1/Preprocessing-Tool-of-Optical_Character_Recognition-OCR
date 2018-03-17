function Alignment4(Alig_Zone_path,mid_zone_img,page_count,line_count,word_count)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

 

[totalobj_mid,ACCmid_img]=ZoneBlock(mid_zone_img);


for i=1:totalobj_mid
       
        midimg_block=1-ACCmid_img{i}.word_img;
        result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(i),'_',num2str(2),'_mid.bmp');
        imwrite(midimg_block,result);
     end







end

