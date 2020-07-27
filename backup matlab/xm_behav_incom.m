clear all
clc

% input files
path = '/Users/xiaoma/Box/PVDM/Matlab_code/input';
pathR = '/Users/xiaoma/Box/PVDM/Matlab_code/output/beh_c_ratings/';
pathH = '/Users/xiaoma/Box/PVDM/Matlab_code/output/beh_c_hddm/';
pathE = '/Users/xiaoma/Box/PVDM/Matlab_code/output/beh_c_eye/';

subjects_xm = {'232'};
%119, 124, 230, 232 wrong for same reason, not sure why

choice = {'/Users/xiaoma/Box/PVDM/Matlab_code/input/choice_232.xlsx'};

rate1 = {'/Users/xiaoma/Box/PVDM/Matlab_code/input/rate2_232.xlsx'};


rate2 = {'/Users/xiaoma/Box/PVDM/Matlab_code/input/rate2_232.xlsx'};
     
[black_data, black_text]= xlsread('/Users/xiaoma/Box/PVDM/Matlab_code/input/Bratings.xlsx');

% results files
results_file = 'Choice_indecies.txt';
fid2 = fopen(results_file,'w');
fprintf(fid2,'subject\tNV\tNVvar\tCO_like\tCO1_like\tCO2_like\tCOeasy_like\tCO1easy_like\tCO2easy_like\tCOdiff_like\tCO1diff_like\tCO2diff_like\tCI_like\tCIeasy_like\tCIdiff_like\tlnRT_like\tlnRTeasy_like\tlnRTdiff_like\tCO_black\tCO1_black\tCO2_black\tCOeasy_black\tCO1easy_black\tCO2easy_black\tCOdiff_black\tCO1diff_black\tCO2diff_black\tCI_black\tCIeasy_black\tCIdiff_black\tlnRT_black\tlnRTeasy_black\tlnRTdiff_black\n');


for sub = 1 : length(subjects_xm)
    
    subject = subjects_xm{sub};
    fprintf('  Subject %s\n',subject)
    
   %extract subject's data
    file_choice = char(choice(sub));
    [choice_data, choice_text]= xlsread(file_choice); %choice
    
    file_rate1 = char(rate1(sub));
    [rate1_data, rate1_text]= xlsread(file_rate1); %rating 1
    
    file_rate2 = char(rate2(sub));
    [rate2_data, rate2_text]= xlsread(file_rate2); % rating 2
    
    rate = zeros(length(rate1_data),3);  
    
   % generate ratings data
    ratings_file = [pathR  subject '_ratings.txt'];
    rate = ratings(subject, ratings_file, rate1_data, rate2_data);
    
   % Extracting choices from Like blocks
    Index0 = strfind(choice_text(:,3),'ChooseLike');
    Index = find(not(cellfun('isempty',Index0)))-1;
    choice_Like = choice_data(Index,:);
    pairsL = LikeChoiceBlocks(choice_Like, rate);
    
   % Extracting choices from Black blocks
    Index0B = strfind(choice_text(:,3),'ChooseBlack');
    IndexB = find(not(cellfun('isempty',Index0B)))-1;
    choice_Black = choice_data(IndexB,:);
    [pairsB] = BlackChoiceBlocks(choice_Black, black_data);
    
   % generate descriptives of pairs from Black blocks
    choice_Black1 = choice_Black(1:100,:);
    choice_Black2 = choice_Black(101:200, :);
       
   
   % Generating choice data statistics for the subject 
   % Like blocks
     nv_images = zeros(length (rate2_data),1);
     for k = 1: length (rate2_data)
         nv_image(k) = find(rate(:,1) == rate2_data(k,2));
     end
          
     NV = mean(rate(nv_image,3));    
     NVvar = var(rate(nv_image,3));    

     CO1L = mean(pairsL(:,8));
     CO2L = mean(pairsL(:,9));
     COL  = (mean(pairsL(:,8)) + mean(pairsL(:,9)))/2;
     CIL = mean(pairsL(:,10));
     lnRTL = mean(pairsL(find(pairsL(:,11)<2),11));
    
   % Generating choice data statistics for easy and difficult pairs for the subject
     easy_pairsL = pairsL(find(pairsL(:,7)==0),:);
     diff_pairsL = pairsL(find(pairsL(:,7)==1),:);
    
     CO1_easyL = mean(easy_pairsL(:,8));
     CO2_easyL = mean(easy_pairsL(:,9));
     CO1_diffL = mean(diff_pairsL(:,8));
     CO2_diffL = mean(diff_pairsL(:,9));   
     CO_easyL = (mean(easy_pairsL(:,8)) + mean(easy_pairsL(:,9)))/2;
     CO_diffL = (mean(diff_pairsL(:,8)) + mean(diff_pairsL(:,9)))/2;
     
     CI_easyL = mean(easy_pairsL(:,10));
     CI_diffL = mean(diff_pairsL(:,10));
     
     lnRT_easyL = mean(easy_pairsL(:,11));
     lnRT_diffL = mean(diff_pairsL(:,11));
     
    % Black blocks
     CO1B = mean(pairsB(:,8));
     CO2B = mean(pairsB(:,9));
     COB  = (mean(pairsB(:,8)) + mean(pairsB(:,9)))/2;
     CIB = mean(pairsB(:,10));
     lnRTB = mean(pairsB(find(pairsB(:,11)<2),11));
    
   % Generating choice data statistics for easy and difficult pairs for the subject
     easy_pairsB = pairsL(find(pairsB(:,7)==0),:);
     diff_pairsB = pairsL(find(pairsB(:,7)==1),:);
    
     CO1_easyB = mean(easy_pairsB(:,8));
     CO2_easyB = mean(easy_pairsB(:,9));
     CO1_diffB = mean(diff_pairsB(:,8));
     CO2_diffB = mean(diff_pairsB(:,9));   
     CO_easyB = (mean(easy_pairsB(:,8)) + mean(easy_pairsB(:,9)))/2;
     CO_diffB = (mean(diff_pairsB(:,8)) + mean(diff_pairsB(:,9)))/2;
     
     CI_easyB = mean(easy_pairsB(:,10));
     CI_diffB = mean(diff_pairsB(:,10));
     
     lnRT_easyB = mean(easy_pairsB(:,11));
     lnRT_diffB = mean(diff_pairsB(:,11));
     
   % Printing choice data summary statistics  for the subject 
    fprintf(fid2,'%s\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n',...
            subject,NV,NVvar,COL, CO1L, CO2L, CO_easyL, CO1_easyL, CO2_easyL, CO_diffL, CO1_diffL, CO2_diffL, CIL, CI_easyL, CI_diffL, lnRTL, lnRT_easyL, lnRT_diffL,...
            COB, CO1B, CO2B, CO_easyB, CO1_easyB, CO2_easyB, CO_diffB, CO1_diffB, CO2_diffB, CIB, CI_easyB, CI_diffB, lnRTB, lnRT_easyB, lnRT_diffB);
    
   % Generate inputs for hddm analyses for the subject
    hddm = hddm_input(sub, choice_data, choice_text, black_data, black_text, rate);
    hddm_Xfile = [pathH  subject '_hddm.xlsx'];
    hddm_file = [pathH  subject '_hddm.csv'];
    writetable(hddm,hddm_Xfile,'Sheet',1,'Range','A1');
    writetable(hddm,hddm_file);
    
end
fclose(fid2);
        
    
    

     