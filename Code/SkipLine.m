function SkipLine(Skip_word_info,Total_lines,zone_path,Alig_Zone_path)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


h=size(Skip_word_info);
k=size(Total_lines);

StartPoint=zeros(k(1,2),1);
EndPoint=zeros(k(1,2),1);
Line_height=zeros(k(1,2),1);


if h(1,2)>0

    
    
    for i=1:1:h(1,2)
            count=0;
        
             for q=1:1:k(1,2)
                 if  Skip_word_info(i).pc==Total_lines(q).page
                     count=count+1; 
                     StartPoint(count,1)=Total_lines(q).cut1;
                     EndPoint(count,1)=Total_lines(q).cut2;
                     Line_height(count,1)=Total_lines(q).LH;
                 end      
             end       
        
             
             
             
             
             
        
             
                     StartPoint=StartPoint(1:count,:);
                     EndPoint=EndPoint(1:count,:);
                     Line_height=Line_height(1:count,:);
                     
                     c1=mode(StartPoint);
                     c2=mode(EndPoint);
                     LH=mode(Line_height);
                     
                     disp(c1);
                     disp(c2);
                     disp(LH);
                                           
                     wordimg=Skip_word_info(i).img;
                     
                     
%                      WH=size(wordimg,1);
%                      
%                      Y=(WH/LH)*c1;
%                      H=(WH/LH)*c2;
%                      
                     
                     
                     
                     Mark_point_Info.Y=c1;
                     Mark_point_Info.H=c2;
                     page_count=Skip_word_info(i).pc;
                     line_count=Skip_word_info(i).lc;
                     wm=Skip_word_info(i).wc;
                     
                     
                     
                     Skip_word_zone(wordimg,Mark_point_Info,zone_path,Alig_Zone_path,page_count,line_count,wm);
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                      
    
    
    end
    
    
    
    
    
    
    
end







end

