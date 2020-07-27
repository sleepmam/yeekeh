function [pairsB] = fBlackChoiceBlocks(choice_Black, Brate)

    % generate descriptives of pairs from Like blocks
    %choice_Black1 = choice_Black(1:100,:);
    %choice_Black2 = choice_Black(101:200, :);


    % analysing choices from Like condition
    pairsB = zeros(102,9);
    pairsB(:,1) = choice_Black(:,1); % subject #
    pairsB(:,2) = choice_Black(:,5); % image 1
    pairsB(:,3) = choice_Black(:,6); % image 2
    
    for i = 1:102
        
        if pairsB(i,2) == 0
            pairsB(i,4) = 1;
        else
            pairsB(i,4) = Brate(find(Brate(:,1)== pairsB(i,2)),2); % rate image 1
        end
        
        if pairsB (i,3) == 0
            pairsB(i,5) = 1;
        else
            pairsB(i,5) = Brate(find(Brate(:,1)== pairsB(i,3)),2); % rate image 2
        end
        
        pairsB(i,6) = abs(pairsB(i,4)-pairsB(i,5));         % distance in ratings
        if pairsB(i,6)<3                                    % classifying the pair as Easy or Difficult
            pairsB(i,7) = 1;
        else
            pairsB(i,7) = 0;
        end
        
       % indx = find(choice_Black2(:,5) == pairsB(i,2) & choice_Black2(:,6) == pairsB(i,3)); 
       % ind  = indx(1);
        
        % derive choice optimality
        if      pairsB(i,4) == pairsB(i,5)
                pairsB(i,8) = 1;
                
        elseif pairsB(i,4) > pairsB(i,5)
            
                if choice_Black(i,7)== 1
                    pairsB(i,8) = 1; 
                else
                    pairsB(i,8) = 0;
                end
                
                if choice_Black(i,7)== 2
                    pairsB(i,8) = 0; 
                else
                    pairsB(i,8) = 1;
                end    
                
                
                
             
        elseif pairsB(i,4) < pairsB(i,5)
            
                if choice_Black(i,7)== 1
                    pairsB(i,8) = 0; 
                else
                    pairsB(i,8) = 1;
                end
                
                if choice_Black(i,7)== 2
                    pairsB(i,8) = 1; 
                else
                    pairsB(i,8) = 0;
                end      
                
                 
        end
        
          
        pairsB(i,9) = log((choice_Black(i,8))/1000) ; % log-transformed reaction time
        
    end
    
     
    
end
