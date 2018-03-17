function MY_Binarization(orgimg_path,bwimage_path)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

docs=dir(orgimg_path);

page_count=0;

for j=3:1:size(docs)
    page_count=page_count+1;
    
    orgimage=imread(strcat(orgimg_path,'\',docs(j).name));    
    
    
    if islogical(orgimage)~=1
        orgimage=im2bw(orgimage);
        bwimage=strcat(bwimage_path,'\',num2str(page_count),'_page.bmp');
        imwrite(orgimage,bwimage);
    else    
        bwimage=strcat(bwimage_path,'\',num2str(page_count),'_page.bmp');
        imwrite(orgimage,bwimage);
    end
    
    
end
    



