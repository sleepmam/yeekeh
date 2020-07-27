clear all
clc
% input files
path = 'C:\Users\hp245\Data_Analysis\PVDM\';
pathR = 'C:\Users\hp245\Data_Analysis\PVDM\ratings\';
pathH = 'C:\Users\hp245\Data_Analysis\PVDM\hddm\';
pathE = 'C:\Users\hp245\Data_Analysis\PVDM\eye\';
pathIn = 'C:\Users\hp245\Data_Analysis\PVDM\input\';
file_blackness = [pathR 'Bratings.xlsx'];
blackness_data = xlsread(file_blackness); %Blackness

subjects = {  '103', '104', '105', '106', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118',  '122', '130', ...
            '201', '202', '203', '204', '206', '207', '209', '210', '212', '214', '215', '216', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '264'};



for sub = 1 : length(subjects)
    
    subject = subjects{sub};
    fprintf('  Subject %s\n',subject)
    
    %extract subject's data
    
    file_choice = [pathIn 'choice_' subject '.xlsx'];
    [choice_data, choice_text]= xlsread(file_choice); %choice
    
    file_ratings = [pathR subject '_ratings.xlsx'];
    [ratings_data, ratings_text]= xlsread(file_ratings); %ratings
    

    
    file_eyemove = [pathIn 'eye_' subject '.xlsx'];
    [eyemove_data, eyemove_text]= xlsread(file_eyemove); % eye movement
    
   
    
   % Extract data by choice blocks
   
   % Choose Like 1 block
 
    eyeChoiceL1_data = eyemove_data(find(eyemove_data(:,3) == 1),:);
    eyeChoiceL1_text = eyemove_text(find(eyemove_data(:,3) == 1),:);
    
    IndexL1_Img1 = find(not(cellfun('isempty',strfind(eyeChoiceL1_text(:,11),'Image1'))));
    IndexL1_Img2 = find(not(cellfun('isempty',strfind(eyeChoiceL1_text(:,11),'Image2'))));
    eyeChoiceL1_Img1_data = eyeChoiceL1_data(IndexL1_Img1,:);
    eyeChoiceL1_Img2_data = eyeChoiceL1_data(IndexL1_Img2,:);
    
    choiceL1_data = choice_data((find(not(cellfun('isempty',strfind(choice_text(:,3),'ChooseLike1'))))-1),:);
    
   % Choose Like 2 block
    eyeChoiceL2_data = eyemove_data(find(eyemove_data(:,3) == 3),:);
    eyeChoiceL2_text = eyemove_text(find(eyemove_data(:,3) == 3),:);
    
    IndexL2_Img1 = find(not(cellfun('isempty',strfind(eyeChoiceL2_text(:,11),'Image1'))));
    IndexL2_Img2 = find(not(cellfun('isempty',strfind(eyeChoiceL2_text(:,11),'Image2'))));
    eyeChoiceL2_Img1_data = eyeChoiceL2_data(IndexL2_Img1,:);
    eyeChoiceL2_Img2_data = eyeChoiceL2_data(IndexL2_Img2,:);  
    
    choiceL2_data = choice_data((find(not(cellfun('isempty',strfind(choice_text(:,3),'ChooseLike2'))))-1),:);
    
   % Choose Black 1 block
    eyeChoiceB1_data = eyemove_data(find(eyemove_data(:,3) == 2),:);
    eyeChoiceB1_text = eyemove_text(find(eyemove_data(:,3) == 2),:);
    
    IndexB1_Img1 = find(not(cellfun('isempty',strfind(eyeChoiceB1_text(:,11),'Image1'))));
    IndexB1_Img2 = find(not(cellfun('isempty',strfind(eyeChoiceB1_text(:,11),'Image2'))));
    eyeChoiceB1_Img1_data = eyeChoiceB1_data(IndexB1_Img1,:);
    eyeChoiceB1_Img2_data = eyeChoiceB1_data(IndexB1_Img2,:); 
    
    choiceB1_data = choice_data((find(not(cellfun('isempty',strfind(choice_text(:,3),'ChooseBlack1'))))-1),:);
    
    % Choose Black 2 block
    eyeChoiceB2_data = eyemove_data(find(eyemove_data(:,3) == 4),:);
    eyeChoiceB2_text = eyemove_text(find(eyemove_data(:,3) == 4),:);
    
    IndexB2_Img1 = find(not(cellfun('isempty',strfind(eyeChoiceB2_text(:,11),'Image1'))));
    IndexB2_Img2 = find(not(cellfun('isempty',strfind(eyeChoiceB2_text(:,11),'Image2'))));
    eyeChoiceB2_Img1_data = eyeChoiceB2_data(IndexB2_Img1,:);
    eyeChoiceB2_Img2_data = eyeChoiceB2_data(IndexB2_Img2,:); 
    
    choiceB2_data = choice_data((find(not(cellfun('isempty',strfind(choice_text(:,3),'ChooseBlack2'))))-1),:);
    
    % Set up support files
    durL1_Img1 = zeros(100,1); rateL1_Img1 = zeros(100,1);
    durL1_Img2 = zeros(100,1); rateL1_Img2 = zeros(100,1);
    durL2_Img1 = zeros(100,1); rateL2_Img1 = zeros(100,1);
    durL2_Img2 = zeros(100,1); rateL2_Img2 = zeros(100,1);
    durB1_Img1 = zeros(100,1); rateB1_Img1 = zeros(100,1);
    durB1_Img2 = zeros(100,1); rateB1_Img2 = zeros(100,1);
    durB2_Img1 = zeros(100,1); rateB2_Img1 = zeros(100,1);
    durB2_Img2 = zeros(100,1); rateB2_Img2 = zeros(100,1);   
    durL1 = zeros(100,1);
    durL2 = zeros(100,1);
    durB1 = zeros(100,1);
    durB2 = zeros(100,1);   
    
    
    
    % Extract data by trials for each choice block
    for trial = 1 : 100
        
        % Like 1 Block
        eyeChoiceL1_Img1_data_trial = eyeChoiceL1_Img1_data(find(eyeChoiceL1_Img1_data(:,4) == trial),:);
        durL1_Img1(trial) = sum(eyeChoiceL1_Img1_data_trial(:,12))/1000;
    
        eyeChoiceL1_Img2_data_trial = eyeChoiceL1_Img2_data(find(eyeChoiceL1_Img2_data(:,4) == trial),:);
        durL1_Img2(trial) = sum(eyeChoiceL1_Img2_data_trial(:,12))/1000; 
        
        durL1(trial) = sum(eyeChoiceL1_data(find(eyeChoiceL1_data(:,4) == trial),12));
        
        rateL1_Img1(trial) = ratings_data(choiceL1_data(trial,5)+1,3);
        rateL1_Img2(trial) = ratings_data(choiceL1_data(trial,6)+1,3);
        
        % Like 2 Block
        eyeChoiceL2_Img1_data_trial = eyeChoiceL2_Img1_data(find(eyeChoiceL2_Img1_data(:,4) == trial),:);
        durL2_Img1(trial) = sum(eyeChoiceL2_Img1_data_trial(:,12))/1000;
    
        eyeChoiceL2_Img2_data_trial = eyeChoiceL2_Img2_data(find(eyeChoiceL2_Img2_data(:,4) == trial),:);
        durL2_Img2(trial) = sum(eyeChoiceL2_Img2_data_trial(:,12))/1000;
        
        durL2(trial) = sum(eyeChoiceL2_data(find(eyeChoiceL2_data(:,4) == trial),12));
        
        rateL2_Img1(trial) = ratings_data(choiceL2_data(trial,5)+1,3);
        rateL2_Img2(trial) = ratings_data(choiceL2_data(trial,6)+1,3); 

        
        % Black 1 Block
        eyeChoiceB1_Img1_data_trial = eyeChoiceB1_Img1_data(find(eyeChoiceB1_Img1_data(:,4) == trial),:);
        durB1_Img1(trial) = sum(eyeChoiceB1_Img1_data_trial(:,12))/1000;
    
        eyeChoiceB1_Img2_data_trial = eyeChoiceB1_Img2_data(find(eyeChoiceB1_Img2_data(:,4) == trial),:);
        durB1_Img2(trial) = sum(eyeChoiceB1_Img2_data_trial(:,12))/1000;
        
        durB1(trial) = sum(eyeChoiceB1_data(find(eyeChoiceB1_data(:,4) == trial),12));
        
        rateB1_Img1(trial) = blackness_data(choiceB1_data(trial,5),2);
        rateB1_Img2(trial) = blackness_data(choiceB1_data(trial,6),2);       
        
        
        % Black 2 Block
        eyeChoiceB2_Img1_data_trial = eyeChoiceB2_Img1_data(find(eyeChoiceB2_Img1_data(:,4) == trial),:);
        durB2_Img1(trial) = sum(eyeChoiceB2_Img1_data_trial(:,12))/1000;
    
        eyeChoiceB2_Img2_data_trial = eyeChoiceB2_Img2_data(find(eyeChoiceB2_Img2_data(:,4) == trial),:);
        durB2_Img2(trial) = sum(eyeChoiceB2_Img2_data_trial(:,12))/1000;      
        
        durB2(trial) = sum(eyeChoiceB2_data(find(eyeChoiceB2_data(:,4) == trial),12));
        
        rateB2_Img1(trial) = blackness_data(choiceB2_data(trial,5),2); 
        rateB2_Img2(trial) = blackness_data(choiceB2_data(trial,6),2); 
    end
    
 
   Choices = [choiceL1_data; choiceL2_data; choiceB1_data; choiceB2_data]; 
   subj = Choices(:,1);
   blockN = Choices(:,2);
   blockT = [choice_text(find(choice_data(:,2)==1)+1,3); choice_text(find(choice_data(:,2)==3)+1,3); choice_text(find(choice_data(:,2)==2)+1,3); choice_text(find(choice_data(:,2)==4)+1,3)];
   trialN = Choices(:,4);
   image1 = Choices(:,5);
   image2 = Choices(:,6);
   resp = Choices(:,7);
   rt = Choices(:,8)/1000;
   rate1 = [rateL1_Img1;rateL2_Img1; rateB1_Img1; rateB2_Img1];
   rate2 = [rateL1_Img2;rateL2_Img2; rateB2_Img2;rateB2_Img2];
   dur1 =  [durL1_Img1; durL2_Img1; durB1_Img1; durB2_Img1];
   dur2 =  [durL1_Img2; durL2_Img2; durB1_Img2; durB2_Img2];
   dur = [durL1/1000; durL2/1000; durB1/1000; durB2/1000 ];
       
  
    
   Eye = table(subj, blockN, blockT, trialN, image1, image2, rate1, rate2, dur1, dur2, resp, rt, dur);
   Eye_Xfile = [pathE  subject '_dur.xlsx'];
   writetable(Eye, Eye_Xfile,'Sheet',1,'Range','A1');
       
end
%fclose(fid2);
        
    
    

     