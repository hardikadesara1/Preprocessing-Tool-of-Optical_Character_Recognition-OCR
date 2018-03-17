function  [zone_detail,Get_point] = ExtrackBlock(line_img,Get_point)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


        line_img=1-line_img;
        
        Height_of_line=size(line_img,1);
        
        CC=bwconncomp(line_img);
        
        totalobj=CC.NumObjects;
         
        
   
if(totalobj>0)
    
    for i=1:1:CC.NumObjects
        
        R=mod(CC.PixelIdxList{i},size(line_img,1));
        C=CC.PixelIdxList{i}/size(line_img,1);
        
        for j=1:1:size(R,1)
            if(R(j)==0)
                R(j)=size(line_img,1);
            end
        end
        
        for k=1:1:size(C,1)
            C=ceil(C);
        end
        
        minR=min(R);minC=min(C);
        maxR=max(R);maxC=max(C);
        
    
        
        tempword_imgACC=zeros((maxR-minR+1),(maxC-minC+1));
        
        
        for m=1:1:size(R,1)
            tempword_imgACC(R(m)-minR+1,C(m)-minC+1)=1;
        end
        
        tempword_imgFCC=zeros(size(line_img,1),(maxC-minC+1));
        
        for m=1:1:size(R,1)
            tempword_imgFCC(R(m),C(m)-minC+1)=1;
        end
        
        
        
        
        ACCword_img{i}.word_img =tempword_imgACC;
        ACCword_img{i}.X=minC;
        ACCword_img{i}.Y=minR;
        ACCword_img{i}.W=(maxC-minC+1);
        ACCword_img{i}.H=(maxR-minR+1);
        FCCword_img{i}.word_img=tempword_imgFCC;%imcrop(word_img,[minC 1 (maxC-minC+1) size(word_img,1)]);
        FCCword_img{i}.X=minC;
        FCCword_img{i}.Y=1;
        FCCword_img{i}.W=(maxC-minC+1);
        FCCword_img{i}.H=size(line_img,1);        
        
    end
    

    
    %..........mark the cutpoint......%
    
    [zone_detail,Get_point]=MarkPoint(CC,ACCword_img,Height_of_line,Get_point);
    
    %......over marking...........%
    
    
    
    
    
    
    
    
    
    
    
    
else
     ACCword_img=0;
     FCCword_img=0;

    
       
end
    
    
    
    
    
    
    
    
    
    
    
end














