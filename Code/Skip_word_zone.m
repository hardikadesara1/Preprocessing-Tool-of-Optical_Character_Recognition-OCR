function Skip_word_zone(wordimg,zone_detail,zone_path,Alig_Zone_path,page_count,line_count,word_count )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here




      WH=size(wordimg,1);
      
      Error_Margin=floor(WH*0.10);
      
      
      k=((zone_detail.Y+zone_detail.H)-WH);
      One_zone=sqrt(k^2);
      
      flag1=0;
      
      
      I4=im2bw(wordimg);
        I4=1-I4;
        
        
        
        hprof = sum(I4,2); 
        foravg=zeros(200,1);
        
        flag=1;
        
        count=0;
        c=0;
        
        up=0;low=0;mid=0;
        for z=1:WH
            
            if hprof(z,1)~=0
             
                count=count+1;
                foravg(count)=hprof(z,1);
            
            end
        end
        
        
        foravg=foravg(1:count,:);
        
        avg=mean(foravg);
       
      
if zone_detail.Y<WH
          
          
 %...1st condition         
          
     if One_zone<=Error_Margin
              
             
              
              
           
         for z=1:WH
            
            if hprof(z,1)>=avg&&flag==1
                
                Y=z;
                flag=2;
            end
            
            if hprof(z,1)<=avg&&flag==2 
                H=z;    
                flag=3;     
            end
         end
         
         
         
              
              cut1=1;
              cut2=Y;
              cut3=H;
              cut4=WH;
              
     if (cut2-cut1>=Error_Margin)&&(1<Y)
              
              
            
            upp_zone_img=wordimg(cut1:cut2,:);
         
            result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(1),'_up.bmp');
            imwrite(upp_zone_img,result);
        
            up=1;
     end              
    if (cut4-cut3)<(cut3-cut2)
            
            if (cut4-cut3>=Error_Margin)&&(H<=WH)
            
                
             low_zone_img=wordimg(cut3:cut4,:);
             
             result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(3),'_low.bmp');
             imwrite(low_zone_img,result);
             
             low=1;
         
            
            end
            
 
            
                
         if (up==1&&low==1)  
   
            mid_zone_img=wordimg(cut2:cut3,:);      
            result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
            imwrite(mid_zone_img,result);
            Alignment1(Alig_Zone_path,upp_zone_img,mid_zone_img,low_zone_img,page_count,line_count,word_count);
            mid=1;
         end
            
         
         if (up==1&&mid==0)
              
              
                 
               mid_zone_img=wordimg(cut2:cut4,:);      
               result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
               imwrite(mid_zone_img,result);
               mid=1;
               
              Alignment2(Alig_Zone_path,upp_zone_img,mid_zone_img,page_count,line_count,word_count);
         end
                  
          if (low==1&&mid==0)
                 
                 
               mid_zone_img=wordimg(cut1:cut3,:);      
               result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
               imwrite(mid_zone_img,result);
               Alignment3(Alig_Zone_path,mid_zone_img,low_zone_img,page_count,line_count,word_count);
               mid=1;
          end
          
              
          if (mid==0)
                 
                mid_zone_img=wordimg(cut1:cut4,:);
                result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
                imwrite(mid_zone_img,result);
                Alignment4(Alig_Zone_path,mid_zone_img,page_count,line_count,word_count);
                
          end
          
          
          
  else
              if up==1   
                mid_zone_img=wordimg(cut2:cut4,:);
                result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
                imwrite(mid_zone_img,result);
                Alignment2(Alig_Zone_path,upp_zone_img,mid_zone_img,page_count,line_count,word_count);
                
              else
                mid_zone_img=wordimg(cut2:cut4,:);
                result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
                imwrite(mid_zone_img,result);
                Alignment4(Alig_Zone_path,mid_zone_img,page_count,line_count,word_count);
              end
           
                
                
end
                
                flag1=1;
              
 %......2nd condition....             
     elseif zone_detail.Y+zone_detail.H<WH
              cut1=1;
              cut2=zone_detail.Y;
              cut3=zone_detail.Y+zone_detail.H;
              cut4=WH;
              
              
             upp_zone_img=wordimg(cut1:cut2,:);
          
             result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(1),'_up.bmp');
             imwrite(upp_zone_img,result);
             
 if (cut4-cut3)<(cut3-cut2)             
             low_zone_img=wordimg(cut3:cut4,:);
              
              result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(3),'_low.bmp');
              imwrite(low_zone_img,result);
              
              
              mid_zone_img=wordimg(cut2:cut3,:);      
              result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
              imwrite(mid_zone_img,result);
              
              Alignment1(Alig_Zone_path,upp_zone_img,mid_zone_img,low_zone_img,page_count,line_count,word_count);
             
                             
 else
     
        mid_zone_img=wordimg(cut2:cut4,:);      
              result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
              imwrite(mid_zone_img,result);
              Alignment2(Alig_Zone_path,upp_zone_img,mid_zone_img,page_count,line_count,word_count);
              
                           
              
 end
 
 flag1=1;
 
     
 
 
 
  
          
     elseif (zone_detail.Y+zone_detail.H)==WH
              result=strcat(zone_path,'\','\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
              imwrite(wordimg,result);
              Alignment4(Alig_Zone_path,mid_zone_img,page_count,line_count,word_count);
              flag1=1;
              
          end
          
          
          
          
          if flag1==0
              
              
              result=strcat(zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(2),'_mid.bmp');
              imwrite(wordimg,result);
              Alignment4(Alig_Zone_path,mid_zone_img,page_count,line_count,word_count);
                 
          end
          
         
          
end
end

