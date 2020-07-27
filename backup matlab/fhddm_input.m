function [hddm] = fhddm_input(sub, choice_data, choice_text, black_data, black_text, rate)

    subj = choice_data(:,1);
    block = choice_data(:,2);
    trial = choice_data(:,4);
    dist = zeros(length(choice_data),1);
    diff = zeros(length(choice_data),1);
    acc = zeros(length(choice_data),1);   
    acc = zeros(length(choice_data),1);
    R1 = zeros(length(choice_data),1);
    R2 = zeros(length(choice_data),1);
    condition = choice_text(2:205,3);
    
    for i = 1: length(choice_data)
        if contains(choice_text(i+1,3),"Like")==1
            condition(i) = {'Like'};
        elseif contains(choice_text(i+1,3),"Black")==1
            condition(i) = {'Black'}; 
        end
    end
    
    
    
    for i = 1: length(choice_data)
    
        if contains(choice_text(i+1,3),"Like")==1
            if choice_data(i,5) == 0
                R1(i) = 1; % FIND RATING OF THE DEFAULT IMAGE
            else
                R1(i) = rate(find(rate(:,1)== choice_data(i,5)),2); % rate image 1 - like
            end
            if choice_data(i,6) == 0               
                R2(i) = 1;
            else
                R2(i) = rate(find(rate(:,1)== choice_data(i,6)),2); % rate image 2
            end
            
        elseif contains(choice_text(i+1,3),"Black")==1 
            if choice_data(i,5) == 0
                R1(i) = 1; % FIND RATING OF THE DEFAULT IMAGE
            else
                 R1(i) = black_data(find(black_data(:,1)== choice_data(i,5)),2); % rate image 1 - black
            end
            if choice_data(i,6) == 0
                R2(i) = 1;
            else
                R2(i) = black_data(find(black_data(:,1)== choice_data(i,6)),2); % rate image 2 - black
            end            

        end
        

         dist(i) = abs(R1(i)-R2(i));
        
        
        if dist(i) < 3
            diff(i) = 1;
        else
            diff(i) = 0;
        end
        

        if      R1(i) == R2(i)
                acc(i) = 1;
         elseif  R1(i) > R2(i)
            
                if choice_data(i,7)== 1
                    acc(i) = 1; 
                else
                    acc(i) = 0;
                end
                
                if choice_data(i,7)== 2
                    acc(i) = 0; 
                else
                    acc(i) = 1;
                end    
        elseif  R1(i) < R2(i)
            
                if choice_data(i,7)== 1
                    acc(i) = 0; 
                else
                    acc(i) = 1;
                end
                
                if choice_data(i,7)== 2
                    acc(i) = 1; 
                else
                    acc(i) = 0;
                end    
        end
    end
    
    
   
    
    rt = choice_data(:,8)/1000;
    response = acc;
    subj_idx = ones(length(choice_data),1) * (sub-1);
    
    hddm = table(subj_idx, subj, rt, response, dist, diff, condition, block, trial);

    
end
