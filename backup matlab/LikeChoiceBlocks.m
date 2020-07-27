function [pairsL] = LikeChoiceBlocks(choice_Like, rate)

    % generate descriptives of pairs from Like blocks
    choice_Like1 = choice_Like(1:100,:);
    choice_Like2 = choice_Like(101:200, :);


    % analysing choices from Like condition
    pairsL = zeros(100,11);
    pairsL(:,1) = choice_Like1(:,1); % subject #
    pairsL(:,2) = choice_Like1(:,5); % image 1
    pairsL(:,3) = choice_Like1(:,6); % image 2
    
    for i = 1:100
        
        if pairsL(i,2) == 0
            pairsL(i,4) = 1;
        else
            pairsL(i,4) = rate(find(rate(:,1)== pairsL(i,2)),2); % rate image 1
        end
        
        if pairsL (i,3) == 0
            pairsL(i,5) = 1;
        else
            pairsL(i,5) = rate(find(rate(:,1)== pairsL(i,3)),2); % rate image 2
        end
        
        pairsL(i,6) = abs(pairsL(i,4)-pairsL(i,5));         % distance in ratings
        if pairsL(i,6)<3                                    % classifying the pair as Easy or Difficult
            pairsL(i,7) = 1;
        else
            pairsL(i,7) = 0;
        end
        
        indx = find(choice_Like2(:,5) == pairsL(i,2) & choice_Like2(:,6) == pairsL(i,3)); 
        ind  = indx(1);
        
        % derive choice optimality
        if      pairsL(i,4) == pairsL(i,5)
                pairsL(i,8) = 1;
                pairsL(i,9) = 1;
        elseif pairsL(i,4) > pairsL(i,5)
            
                if choice_Like1(i,7)== 1
                    pairsL(i,8) = 1; 
                else
                    pairsL(i,8) = 0;
                end
                
                if choice_Like1(i,7)== 2
                    pairsL(i,8) = 0; 
                else
                    pairsL(i,8) = 1;
                end    
                
                if choice_Like2(ind,7)== 1
                    pairsL(i,9) = 1; 
                else
                    pairsL(i,9) = 0;
                end
                
                if choice_Like2(ind,7)== 2
                    pairsL(i,9) = 0; 
                else
                    pairsL(i,9) = 1;
                end    
                
             
        elseif pairsL(i,4) < pairsL(i,5)
            
                if choice_Like1(i,7)== 1
                    pairsL(i,8) = 0; 
                else
                    pairsL(i,8) = 1;
                end
                
                if choice_Like1(i,7)== 2
                    pairsL(i,8) = 1; 
                else
                    pairsL(i,8) = 0;
                end      
                
                if choice_Like2(ind,7)== 1
                    pairsL(i,9) = 0; 
                else
                    pairsL(i,9) = 1;
                end
                
                if choice_Like2(ind,7)== 2
                    pairsL(i,9) = 0; 
                else
                    pairsL(i,9) = 1;
                end  
        end
        
        if pairsL(i,8) == pairsL(i,9)   % derive choice consistency
            
                pairsL(i,10) = 0;
        else
            
                pairsL(i,10) = 1; 
        end
        
          
        pairsL(i,11) = (log((choice_Like1(i,8))/1000) + log((choice_Like2(ind,8)))/1000)/2; % log-transformed reaction time
        
    end
    
     
    
end
