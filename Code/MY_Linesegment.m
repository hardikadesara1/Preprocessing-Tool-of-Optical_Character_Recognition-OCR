function MY_Linesegment(bw_path,line_path)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

bwimgs=dir(bw_path);
page_count=0;

for i=3:1:size(bwimgs)
    
    
    page_count=page_count+1;
    bwimg=imread(strcat(bw_path,'\',bwimgs(i).name));
    inverse_img=1-bwimg;
    
    
     
    
  hprof=sum(inverse_img,2);
  Height_of_bwimg=size(inverse_img,1);
  Width_of_bwimg=size(inverse_img,2);
  plot(hprof,[1:Height_of_bwimg]);



x1=0;x2=0;
y1=0;y2=0;
cropf=1;
crop=1;
flag1=0;flag2=3;
flag3=1;flag4=2;
flag5=0;flag6=0;
flag7=0;
w1=0;
w2=0;
w3=0;
b=1;
k=1;
j=1;
i=1;
w=zeros(500,1);
mid=zeros(500,1);



while i<=Height_of_bwimg
    
    
    if hprof(i,1)~=0&&flag1==0
       w2=0;
       mid=zeros(500,1);
       flag3=1;flag4=2;
       flag2=1;
       w1=w1+1;
       w(w1,1)=hprof(i,1);  
    end
    
    
    
    if hprof(i,1)==0&&flag2==1
        p1=max(w);    
            for j=1:i
                if hprof(j,1)==p1
                    x1=j;
                    
                end
            end 
            w1=0;
            w=zeros(500,1);
            flag1=1;
            flag2=3;
    end
    
     
    if hprof(i,1)~=0&&flag1==1
             
            w1=w1+1;
            w(w1,1)=hprof(i,1);
            flag2=2;
            
            if i+1==Height_of_bwimg
                flag7=1;
            end
       
    end
    
    
    
    
    
    if (hprof(i,1)==0&&flag2==2) 
        p2=max(w);
            for k=j:i
                if hprof(k,1)==p2
                    x2=k;                  
                end
            end 
            w1=0;
            w=zeros(500,1);
    
            flag1=0;flag2=3;

            disp(x1);
            disp(x2);
            
            
            
            for m=x1:x2
                if hprof(m,1)==0
                    crop=m;
                    disp(crop);
                    i=hey(crop);
%                     x1=0;
%                     x2=0;
                    w1=0;
                    w=zeros(500,1);
                    flag3=0;
                    flag4=2;
                    flag5=1;
                    break;
                    
                end
                
                if hprof(m,1)~=0&&flag3==1
                    w2=w2+1;
                    mid(w2,1)=hprof(m,1);
                    flag4=0;
                end
                if m==x2&&flag4==0
                      MIN=min(mid);
                           for n=x1:x2
                               if hprof(n,1)==MIN
                                   crop=n;
                                   disp(crsop);
                                   i=hey(crop);
                                   x1=0;
                                   x2=0;
                                   w=zeros(500,1);
                                   w1=0;
                                   w2=0;
                                   break;
                                   flag5=1;
                               end
                           end
                           flag3=1;flag4=2;
                           
                   end
                   
                   
            end
       
            
            
%     break;        
    end
    
    i=i+1;
    
%.........for last line start.....%    
    if i==Height_of_bwimg&&flag5==1
        
        if flag7==1    
                  for a=x1:Height_of_bwimg    
                      if hprof(a,1)==0&&flag6==0
                          crop=a;  
                          i=hey(crop);
                          crop=Height_of_bwimg;
                          i=hey(crop);
                          flag6=1;
                          flag5=2;
                      end
                  end 
        end
        
        if flag5==1 
                  for a=x2:Height_of_bwimg    
                        if hprof(a,1)==0&&flag6==0 
                        crop=a;
                        i=hey(crop);
                        flag6=1;
                        end
        
                  end
    
        end
        
    end
%.......for last line end.....%





   
   




% 
% linevar=strcat(line_path,'\linevar.mat');
% save(linevar,'w3');
% winopen(line_path);


end

end



%..........CROPING FUNCTION START...........%
 function temp=hey(crop)

   for d=cropf:crop
       if hprof(d,1)~=0
            
           st=d;
           at=crop-st;
           disp(at);
          
          if at>10
              
           w3=w3+1;
           I=imcrop(inverse_img,[1 st Width_of_bwimg at]);
           I=1-I;
%            imshow(I);
         
            
         result = strcat(line_path,'\',num2str(page_count),'_',num2str(w3),'_line.bmp');
         imwrite(I,result);
          
         
         
          end
          cropf=crop;
          temp=crop;
           
          break;
         
          end
   end
   
 end
%.......CROPING FUNCTION START..........%


end





