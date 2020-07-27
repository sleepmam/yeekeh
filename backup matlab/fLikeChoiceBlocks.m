function [pairsL] = fLikeChoiceBlocks(choice_Like, rate)

    % generate descriptives of pairs from Like blocks
    %choice_Like1 = choice_Like(1:51,:);
    %choice_Like2 = choice_Like(52:102, :);


    % analysing choices from Like condition
    [row_cl,col_cl] = size(choice_Like);
    %replace all 102 with row_cl
    
    pairsL = zeros(row_cl,9);
    pairsL(:,1) = choice_Like(:,1); % subject #
    pairsL(:,2) = choice_Like(:,5); % image 1
    pairsL(:,3) = choice_Like(:,6); % image 2
    
    for i = 1:row_cl
        
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
        
       % indx = find(choice_Like2(:,5) == pairsL(i,2) & choice_Like2(:,6) == pairsL(i,3)); 
       % ind  = indx(1);
        
        % derive choice optimality
        if      pairsL(i,4) == pairsL(i,5)
                pairsL(i,8) = 1;
                % pairsL(i,9) = 1;
        elseif pairsL(i,4) > pairsL(i,5)
            
                if choice_Like(i,7)== 1
                    pairsL(i,8) = 1; 
                else
                    pairsL(i,8) = 0;
                end
                
                if choice_Like(i,7)== 2
                    pairsL(i,8) = 0; 
                else
                    pairsL(i,8) = 1;
                end    
                
            
        elseif pairsL(i,4) < pairsL(i,5)
            
                if choice_Like(i,7)== 1
                    pairsL(i,8) = 0; 
                else
                    pairsL(i,8) = 1;
                end
                
                if choice_Like(i,7)== 2
                    pairsL(i,8) = 1; 
                else
                    pairsL(i,8) = 0;
                end      
                
         end
        
       
          
        pairsL(i,9) = log((choice_Like(i,8))/1000) ; % log-transformed reaction time
        
    end
    
     
    
end
