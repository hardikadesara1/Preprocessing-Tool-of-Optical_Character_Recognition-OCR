function ZoneSegment(wordimg,zone_detail,zone_path,Alig_Zone_path,page_count,line_count,word_count)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

        

        Height_of_word=size(wordimg,1);

        
        up=0;low=0;mid=0;
        
        
        
        disp(Height_of_word);          
        Error_Margin=floor(Height_of_word*0.10);
         disp(Error_Margin);
        
         
        
         imshow(wordimg);
         cutpoint1=1;
         cutpoint2=zone_detail.Y-Error_Margin;
         cutpoint3=zone_detail.Y+zone_detail.H+Error_Margin;
         cutpoint4=Height_of_word;

         
         if (cutpoint2-cutpoint1>=Error_Margin)
            upp_zone_img=wordimg(cutpoint1:cutpoint2,:);
         
            result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(1),'_up.bmp');
            imwrite(upp_zone_img,result);
            
         
            up=1;
         end
         
         if (cutpoint4-cutpoint3>=Error_Margin)
          
             low_zone_img=wordimg(cutpoint3:cutpoint4,:);
             
             result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(3),'_low.bmp');
             imwrite(low_zone_img,result);
             
             low=1;
         end
             
             
         if (up==1&&low==1)  
   
            mid_zone_img=wordimg(cutpoint2:cutpoint3,:);      
            result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
            imwrite(mid_zone_img,result);
            mid=1;
            
               Alignment1(Alig_Zone_path,upp_zone_img,mid_zone_img,low_zone_img,page_count,line_count,word_count);
            
         end
          if (up==1&&mid==0)
              
               cutpoint3=zone_detail.Y+zone_detail.H;
                 
               mid_zone_img=wordimg(cutpoint2:cutpoint3,:);      
               result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
               imwrite(mid_zone_img,result);
               mid=1;
                 Alignment2(Alig_Zone_path,upp_zone_img,mid_zone_img,page_count,line_count,word_count);

               
             end
             
          if (low==1&&mid==0)
                 
               cutpoint2=zone_detail.Y;  
               mid_zone_img=wordimg(cutpoint2:cutpoint3,:);      
               result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
               imwrite(mid_zone_img,result);
               mid=1;
               Alignment3(Alig_Zone_path,mid_zone_img,low_zone_img,page_count,line_count,word_count);

          end
             
          if (mid==0)
                 
                cutpoint2=zone_detail.Y;
                cutpoint3=zone_detail.Y+zone_detail.H;
                mid_zone_img=wordimg(cutpoint2:cutpoint3,:);
                result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
                imwrite(mid_zone_img,result);
                 Alignment4(Alig_Zone_path,mid_zone_img,page_count,line_count,word_count);

          end
          
          
end
             
         
             
             
             
             
                 
             
         
     
   













