function MY_Wordsegment(lines_path,words_path,zone_path,Alig_Zone_path)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here



lines=dir(lines_path);
q=0;
p=0;
skip_word=0;

 for i=3:1:size(lines)
        
        str=lines(i).name;
        [page_count,str]=strtok(str,'_');
        [line_count,str]=strtok(str,'_');
        
        line_img=imread(strcat(lines_path,'\',lines(i).name));
        line_img1=im2bw(line_img);   
        line_img2=im2bw(line_img);
         
        
        
        
    
%      .....call extrackblock function.....   
        
                  Get_point=0;
                  Line_Height=size(line_img1,1);
            
             [Mark_point_Info,Get_point]=ExtrackBlock(line_img1,Get_point);
      
             
        if Get_point==1
                     mark1=Mark_point_Info.Y;
                     mark2=Mark_point_Info.H;
                     q=q+1;
                      
             Total_lines(q).cut1=mark1;
             Total_lines(q).cut2=mark2;
             Total_lines(q).page=page_count;
             Total_lines(q).LH=Line_Height;
        end
                 
%............over function........             
        
                 
                 
        inverse_img=1-line_img2;     
        vprof = sum(inverse_img,1);
        Height_of_line=size(vprof,1);
        Width_of_line=size(vprof,2);
             
             
        flag1 = 0;
        limit1 = 0;
        limit2 = 0;
        count = 1;count1=1;
        zeroval= zeros(Width_of_line,1);
        nonzero=zeros(Width_of_line,1);
        crop=1;wm=0;


        for z = 1:Width_of_line 
            if vprof(1,z) == 0 && flag1 == 0
                limit1 = z;
                flag1 = 1;
                zeroval(count,1)= limit1;
            end
            if vprof(1,z) ~= 0 && flag1 == 1
                limit2 = z;
                nonzero(count,1) = limit2;
                count = count + 1;
                flag1 = 0;            
            end
        end
        
        
        nonzero(count,1) = Width_of_line;
        diff1=zeros(1,count-2);
        zeroval=zeroval(1:count,:);
        nonzero=nonzero(1:count,:);
        diff=zeros(1,count);
        
        
        
        for z = 2: count-1 
            diff1(1,count1) = nonzero(z,1)-zeroval(z,1);
            count1=count1+1;
        end
        
      avg=mean(diff1);
    
     
     for z = 2: count
            diff(1,z) = nonzero(z,1)-zeroval(z,1);
     end
     
     
     
     
   
     
     
                      for z = 1:count
                          
                          
                          if diff(1,z)>=avg
                            cutpoint2 =zeroval(z,1)-1;
                                 
                            
                                for z=crop:cutpoint2
                            
                                     if vprof(1,z)~=0
                                         wm=wm+1;
                                         cutpoint1=z;
                                         
                                         
                                         wordimg =inverse_img(:,cutpoint1:cutpoint2);
                                         wordimg = 1 - wordimg;
                                         
                                         result=strcat(words_path,'\',num2str(page_count),'_',num2str(line_count),'_',num2str(wm),'_word.bmp');
                                         imwrite(wordimg,result);

                                         
                                         if Get_point==1
                                            
                                             ZoneSegment(wordimg,Mark_point_Info,zone_path,Alig_Zone_path,page_count,line_count,wm);
                                         
                                         else
                                             skip_word=1;
                                             p=p+1;
                                             Skip_word_info(p).img=wordimg;
                                             Skip_word_info(p).pc=page_count;                                         
                                             Skip_word_info(p).lc=line_count;
                                             Skip_word_info(p).wc=wm;
                                             
                                         mkdir(words_path,'\Skip_word');    
                                         result1=strcat(words_path,'\Skip_word\',num2str(page_count),'_',num2str(line_count),'_',num2str(wm),'_word.bmp');
                                         imwrite(wordimg,result1);
                                             
                                         end
                                         
                                         
                                         break;
                                     end
                                end
                                crop=cutpoint2+1;
                          end
                      end
   
 end

 
 
 
 if skip_word==1
 
 SkipLine(Skip_word_info,Total_lines,zone_path,Alig_Zone_path);
 
 end
 
 
 
 
 
 
 
 
 
end