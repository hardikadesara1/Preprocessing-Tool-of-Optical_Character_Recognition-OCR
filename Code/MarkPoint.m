function [Mark_Info,Get_pt]=MarkPoint(CC,ACCword_img,Height_of_line,Get_point)
%Compute vertical bar in CC 

    get_block=0;
    AspectACC=zeros(CC.NumObjects,1);
    AspectFCC=zeros(CC.NumObjects,1);
  
    for i=1:1:CC.NumObjects
        
        if get_block==0
                AspectACC(i)=(ACCword_img{i}.H)/(ACCword_img{i}.W);
                
                if (AspectACC(i)>=2)&&(ACCword_img{i}.H>Height_of_line*0.4)
                    imshow(ACCword_img{i}.word_img);
                    Mark_Info=ACCword_img{i};
                    get_block=1;
                    Get_point=1;
                    Get_pt=Get_point;
                end
        end
    end
    
    if get_block==0
        Get_point=0;
        Get_pt=Get_point;
        Mark_Info=Get_point;
    end
end


