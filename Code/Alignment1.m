function Alignment1(Alig_Zone_path,upp_zone_img,mid_zone_img,low_zone_img,page_count,line_count,word_count)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

 
[totalobj_mid,ACCmid_img]=ZoneBlock(mid_zone_img);
[totalobj_upp,ACCupp_img]=ZoneBlock(upp_zone_img);
[totalobj_low,ACClow_img]=ZoneBlock(low_zone_img);

Error_com=zeros(totalobj_upp+totalobj_low,1);
count=0;
flag5=0;flag6=0;


distance=zeros(totalobj_mid,totalobj_upp);

for j=1:totalobj_upp
    
    flag=0;
    flag1=0;
    flag2=0;
    k=1;
    
    for i=1:totalobj_mid
        
         distance(i,j)=sqrt((ACCmid_img{i}.X-ACCupp_img{j}.X)^2);
         
         
    end
    
    y(:,j)=sort(distance(:,j));
    
    
if totalobj_mid>=2 
    lowdis1=y(1,j);
    lowdis2=y(2,j);
    
    
    while k<=totalobj_mid
        
        if (distance(k,j)==lowdis1)&&flag1==0
            lowdisindx1=k;
            flag1=1;
            k=k+1;
        end
        
       if k<=totalobj_mid
            if (distance(k,j)==lowdis2)&&flag2==0
            lowdisindx2=k;
            flag2=1;
            end
       end
       
      k=k+1;
    end
    
    
    flag3=0;
   
    
    
       if ((ACCmid_img{lowdisindx1}.X)<=(ACCupp_img{j}.X))&&((ACCupp_img{j}.X)<=(ACCmid_img{lowdisindx1}.X+ACCmid_img{lowdisindx1}.W))
          
           if lowdisindx1>1
           
            if ((ACCmid_img{lowdisindx1}.X)>(ACCmid_img{lowdisindx1-1}.X)+(ACCmid_img{lowdisindx1-1}.W))
                           
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx1),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
                            
            

            
            else
           
              for x=1:totalobj_mid
        
                   if (lowdisindx1~=x)&&flag3==0
                      
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx1}.X))&&((ACCmid_img{lowdisindx1}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx1}.H)
                             count=count+1;
                             Error_com(count,1)=lowdisindx1;
                             
                            lowdisindx1=x;
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx1),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
                            flag3=1;
                            flag5=1;
                            flag=1;
                        end
                   end
              end
               if flag==0
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx1),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);      
               end
              
            end
            
         else
               
               
               if ((ACCmid_img{lowdisindx1}.X)<(ACCmid_img{lowdisindx1+1}.X))
                           
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx1),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
               
               
               
            else
           
              for x=1:totalobj_mid
        
                   if (lowdisindx1~=x)&&flag3==0
                      
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx1}.X))&&((ACCmid_img{lowdisindx1}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx1}.H)
                           
                             count=count+1;
                             Error_com(count,1)=lowdisindx1;
                            
                            lowdisindx1=x;
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx1),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
                            flag3=1;
                            flag5=1;
                            flag=1;
                        end
                   end
              end
               if flag==0
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx1),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result); 
                               
               end
              
            end
            
               
            
            
            
            
      end
          
                        
                           
                   
       
       else if ((ACCmid_img{lowdisindx2}.X)<=(ACCupp_img{j}.X))&&((ACCupp_img{j}.X)<=(ACCmid_img{lowdisindx2}.X+ACCmid_img{lowdisindx2}.W))
         
            if lowdisindx2>1
               
               if ((ACCmid_img{lowdisindx2}.X)>(ACCmid_img{lowdisindx2-1}.X)+(ACCmid_img{lowdisindx2-1}.W))
                           
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx2),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
           
               
               
            else
        
               for x=1:totalobj_mid
        
                   if (lowdisindx2~=x)&&flag3==0
                      
                         if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx2}.X))&&((ACCmid_img{lowdisindx2}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx2}.H)
                
                             count=count+1;
                             Error_com(count,1)=lowdisindx2;
                            
                            lowdisindx2=x;
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx2),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result); 
                          
                            flag3=1;
                            flag5=1;
                            flag=1;
            
                         end
                   end
               end
               
               if flag==0
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx2),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result); 
                          
               
                   
               end
               
               
               
               end
            
                
         else
               
               
               if ((ACCmid_img{lowdisindx2}.X)<(ACCmid_img{lowdisindx2+1}.X))
                           
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx2),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
               
               
               
            else
           
              for x=1:totalobj_mid
        
                   if (lowdisindx2~=x)&&flag3==0
                      
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx2}.X))&&((ACCmid_img{lowdisindx2}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx2}.H)
                
                            count=count+1;
                            Error_com(count,1)=lowdisindx2;
                            
                            lowdisindx2=x;
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx2),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result);    
                            flag3=1;
                            flag5=1;
                            flag=1;
                        end
                   end
              end
              
               if flag==0
                            uppimg_block=1-ACCupp_img{j}.word_img;
                            imshow(uppimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx2),'_',num2str(1),'_upp.bmp');
                            imwrite(uppimg_block,result); 
                          
               
                   
               end
              
            end
            
               
            
            
         
            end    
            end
           end




else
    
     uppimg_block=1-ACCupp_img{j}.word_img;
     imshow(uppimg_block);
     result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(1),'_',num2str(1),'_upp.bmp');
     imwrite(uppimg_block,result); 
                          
    
    
end    


end
                   
                 
                         
    
           
           
       
           
       
       
       










distance1=zeros(totalobj_mid,totalobj_low);

for j=1:totalobj_low
    flag=0;
    flag1=0;
    flag2=0;
    k=1;
    
    for i=1:totalobj_mid
        
         distance1(i,j)=sqrt((ACCmid_img{i}.X-ACClow_img{j}.X)^2);
         
         
    end
    
    y1(:,j)=sort(distance1(:,j));
 disp(size(y1));
    
if totalobj_mid>=2
    
    lowdis3=y1(1,j);
    lowdis4=y1(2,j);
    
    
    while k<=totalobj_mid
        
        if (distance1(k,j)==lowdis3)&&flag1==0
            lowdisindx3=k;
            flag1=1;
            k=k+1;
        end
        
      if k<=totalobj_mid
        if (distance1(k,j)==lowdis4)&&flag2==0
            lowdisindx4=k;
            flag2=1;
        end
      end 
      k=k+1;
    end
    
    
    flag4=0;

    
       if ((ACCmid_img{lowdisindx3}.X)<=(ACClow_img{j}.X))&&((ACClow_img{j}.X)<=(ACCmid_img{lowdisindx3}.X+ACCmid_img{lowdisindx3}.W))
          
           if lowdisindx3>1
           
             if ((ACCmid_img{lowdisindx3}.X)>(ACCmid_img{lowdisindx3-1}.X)+(ACCmid_img{lowdisindx3-1}.W))
                           
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx3),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
                
           
             else
           
           
             for x=1:totalobj_mid
        
                   if (lowdisindx3~=x)&&flag4==0
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx3}.X))&&((ACCmid_img{lowdisindx3}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx3}.H)
                
                            count=count+1;
                            Error_com(count,1)=lowdisindx3;
                            
                            lowdisindx3=x;
                           
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx3),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
           
  
                            flag4=1;
                            flag6=1;
                            flag=1;
            
                        end
                   end
                 
             end
             if flag==0
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx3),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
           
             end
         
            
            
             end
           
           
         else
               
               
               if ((ACCmid_img{lowdisindx3}.X)<(ACCmid_img{lowdisindx3+1}.X))
                           
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx3),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);    
               
               
               
            else
           
              for x=1:totalobj_mid
        
                   if (lowdisindx3~=x)&&flag4==0
                      
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx3}.X))&&((ACCmid_img{lowdisindx3}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx3}.H)
                
                            count=count+1;
                            Error_com(count,1)=lowdisindx3;
                            
                            lowdisindx3=x;
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx3),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);    
               
                            flag4=1;
                            flag6=1;
                            flag=1;
                        end
                   end
              end
              if flag==0
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx3),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
           
             end
        
            end
            
               
            
            
            
            
      end
    
             
           
           
       
       else if ((ACCmid_img{lowdisindx4}.X)<=(ACClow_img{j}.X))&&((ACClow_img{j}.X)<=(ACCmid_img{lowdisindx4}.X+ACCmid_img{lowdisindx4}.W))
              if lowdisindx4>1
               
               if ((ACCmid_img{lowdisindx4}.X)>(ACCmid_img{lowdisindx4-1}.X)+(ACCmid_img{lowdisindx4-1}.W))
                           
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx4),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
           
               
               
               
               
               else
               
                 for x=1:totalobj_mid
        
                   if (lowdisindx4~=x)&&flag4==0
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx4}.X))&&((ACCmid_img{lowdisindx4}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx4}.H)
                
                            count=count+1;
                            Error_com(count,1)=lowdisindx4;
                            
                             lowdisindx4=x;
                                              
                             lowimg_block=1-ACClow_img{j}.word_img;
                             imshow(lowimg_block);
                             result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx4),'_',num2str(3),'_low.bmp');
                             imwrite(lowimg_block,result);
       
                             flag4=1;
                             flag6=1;
                             flag=1;
            
                        end
                   end
                 
                 end
                 if flag==0
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx4),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
           
                end
        
               end
  
              
               
               
            
              else
               
               
               if ((ACCmid_img{lowdisindx4}.X)<(ACCmid_img{lowdisindx4+1}.X))
                           
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx4),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);    
               
               
               
            else
           
              for x=1:totalobj_mid
        
                   if (lowdisindx4~=x)&&flag4==0
                      
                        if ((ACCmid_img{x}.X)<=(ACCmid_img{lowdisindx4}.X))&&((ACCmid_img{lowdisindx4}.X)<=(ACCmid_img{x}.X+ACCmid_img{x}.W))&&(ACCmid_img{x}.H>ACCmid_img{lowdisindx4}.H)
                
                            count=count+1;
                            Error_com(count,1)=lowdisindx4;
                            
                            lowdisindx4=x; 
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx4),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);    
               
                            flag4=1;
                            flag6=1;
                            flag=1;
                        end
                   end
              end
              if flag==0
                            lowimg_block=1-ACClow_img{j}.word_img;
                            imshow(lowimg_block);
                            result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(lowdisindx4),'_',num2str(3),'_low.bmp');
                            imwrite(lowimg_block,result);
           
             end
        
            end
            
        
               
               
               
 
           end
       
           end       
       end


       
else
    
    lowimg_block=1-ACClow_img{j}.word_img;
    imshow(lowimg_block);
    result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(1),'_',num2str(3),'_low.bmp');
    imwrite(lowimg_block,result);
    
    
end

end





 Error_com=Error_com(1:count,:);
 
 disp(size(Error_com));
 
                             
                            
                            





 if flag5==1||flag6==1
     
    for i=1:totalobj_mid
        flag5=0;
        
        for j=1:size(Error_com)
            
            if i==Error_com(j,1)
                
                flag5=1;
            end
        end
        
       if flag5==0;
           
    midimg_block=1-ACCmid_img{i}.word_img;
    result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(i),'_',num2str(2),'_mid.bmp');
    imwrite(midimg_block,result);
    
      end

    end
    
 else
     
    for i=1:totalobj_mid
       
        midimg_block=1-ACCmid_img{i}.word_img;
        result=strcat(Alig_Zone_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(word_count),'_',num2str(i),'_',num2str(2),'_mid.bmp');
        imwrite(midimg_block,result);
    
    end
    
    
 end







end