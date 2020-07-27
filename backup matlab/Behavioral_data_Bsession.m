clear all
clc

% input files
path = 'C:\Users\hp245\Data_Analysis\PVDM\';
pathR = 'C:\Users\hp245\Data_Analysis\PVDM\ratings\';
pathH = 'C:\Users\hp245\Data_Analysis\PVDM\hddm\';
pathE = 'C:\Users\hp245\Data_Analysis\PVDM\eye\';

subjects = {'101', '102', '103', '104', '105', '106', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '120', '122', '123', '126',  '130', ...
            '201', '202', '203', '204', '206', '207', '209', '210', '212', '214', '215', '216', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '228', '229', '264', '296', '297' };
choice = {'input\choice_101.xlsx', 'input\choice_102.xlsx', 'input\choice_103.xlsx', 'input\choice_104.xlsx',  'input\choice_105.xlsx', 'input\choice_106.xlsx', 'input\choice_108.xlsx', ...
          'input\choice_109.xlsx', 'input\choice_110.xlsx', 'input\choice_111.xlsx', 'input\choice_112.xlsx', 'input\choice_113.xlsx', 'input\choice_114.xlsx', 'input\choice_115.xlsx', ...
          'input\choice_116.xlsx', 'input\choice_117.xlsx', 'input\choice_118.xlsx', 'input\choice_120.xlsx', 'input\choice_122.xlsx', 'input\choice_123.xlsx', 'input\choice_126.xlsx',  'input\choice_130.xlsx', ...
          'input\choice_201.xlsx', 'input\choice_202.xlsx', 'input\choice_203.xlsx', 'input\choice_204.xlsx', 'input\choice_206.xlsx', 'input\choice_207.xlsx', 'input\choice_209.xlsx', ...
          'input\choice_210.xlsx', 'input\choice_212.xlsx', 'input\choice_214.xlsx', 'input\choice_215.xlsx', 'input\choice_216.xlsx', 'input\choice_218.xlsx', 'input\choice_219.xlsx', ...
          'input\choice_220.xlsx', 'input\choice_221.xlsx', 'input\choice_222.xlsx', 'input\choice_223.xlsx', 'input\choice_224.xlsx', 'input\choice_225.xlsx', 'input\choice_226.xlsx', ...
          'input\choice_227.xlsx', 'input\choice_228.xlsx', 'input\choice_229.xlsx', 'input\choice_264.xlsx', 'input\choice_296.xlsx', 'input\choice_297.xlsx'};
      
rate1 = { 'input\rate1_101.xlsx', 'input\rate1_102.xlsx', 'input\rate1_103.xlsx', 'input\rate1_104.xlsx',  'input\rate1_105.xlsx', 'input\rate1_106.xlsx', 'input\rate1_108.xlsx', ...
          'input\rate1_109.xlsx', 'input\rate1_110.xlsx', 'input\rate1_111.xlsx', 'input\rate1_112.xlsx', 'input\rate1_113.xlsx', 'input\rate1_114.xlsx', 'input\rate1_115.xlsx', ...
          'input\rate1_116.xlsx', 'input\rate1_117.xlsx', 'input\rate1_118.xlsx', 'input\rate1_120.xlsx', 'input\rate1_122.xlsx', 'input\rate1_123.xlsx', 'input\rate1_126.xlsx', 'input\rate1_130.xlsx', ...
          'input\rate1_201.xlsx', 'input\rate1_202.xlsx', 'input\rate1_203.xlsx', 'input\rate1_204.xlsx', 'input\rate1_206.xlsx', 'input\rate1_207.xlsx', 'input\rate1_209.xlsx', ...
          'input\rate1_210.xlsx', 'input\rate1_212.xlsx', 'input\rate1_214.xlsx', 'input\rate1_215.xlsx', 'input\rate1_216.xlsx', 'input\rate1_218.xlsx', 'input\rate1_219.xlsx', ...
          'input\rate1_220.xlsx', 'input\rate1_221.xlsx', 'input\rate1_222.xlsx', 'input\rate1_223.xlsx', 'input\rate1_224.xlsx', 'input\rate1_225.xlsx', 'input\rate1_226.xlsx', ...
          'input\rate1_227.xlsx', 'input\rate1_228.xlsx', 'input\rate1_229.xlsx', 'input\rate1_264.xlsx', 'input\rate1_296.xlsx', 'input\rate1_297.xlsx' };

rate2 = { 'input\rate2_101.xlsx', 'input\rate2_102.xlsx', 'input\rate2_103.xlsx', 'input\rate2_104.xlsx', 'input\rate2_105.xlsx', 'input\rate2_106.xlsx', 'input\rate2_108.xlsx', ...
          'input\rate2_109.xlsx', 'input\rate2_110.xlsx', 'input\rate2_111.xlsx', 'input\rate2_112.xlsx', 'input\rate2_113.xlsx', 'input\rate2_114.xlsx', 'input\rate2_115.xlsx', ...
          'input\rate2_116.xlsx', 'input\rate2_117.xlsx', 'input\rate2_118.xlsx', 'input\rate2_120.xlsx', 'input\rate2_122.xlsx', 'input\rate2_123.xlsx', 'input\rate2_126.xlsx', 'input\rate2_130.xlsx', ...
          'input\rate2_201.xlsx', 'input\rate2_202.xlsx', 'input\rate2_203.xlsx', 'input\rate2_204.xlsx', 'input\rate2_206.xlsx', 'input\rate2_207.xlsx', 'input\rate2_209.xlsx', ...
          'input\rate2_210.xlsx', 'input\rate2_212.xlsx', 'input\rate2_214.xlsx', 'input\rate2_215.xlsx', 'input\rate2_216.xlsx', 'input\rate2_218.xlsx', 'input\rate2_219.xlsx', ...
          'input\rate2_220.xlsx', 'input\rate2_221.xlsx', 'input\rate2_222.xlsx', 'input\rate2_223.xlsx', 'input\rate2_224.xlsx', 'input\rate2_225.xlsx', 'input\rate2_226.xlsx', ...
          'input\rate2_227.xlsx', 'input\rate2_228.xlsx', 'input\rate2_229.xlsx', 'input\rate2_264.xlsx', 'input\rate2_296.xlsx', 'input\rate2_297.xlsx'};

[black_data, black_text]= xlsread('input\Bratings.xlsx');

% results files
results_file = 'Choice_indecies.txt';
fid2 = fopen(results_file,'w');
fprintf(fid2,'subject\tNV\tNVvar\tCO_like\tCO1_like\tCO2_like\tCOeasy_like\tCO1easy_like\tCO2easy_like\tCOdiff_like\tCO1diff_like\tCO2diff_like\tCI_like\tCIeasy_like\tCIdiff_like\tlnRT_like\tlnRTeasy_like\tlnRTdiff_like\tCO_black\tCO1_black\tCO2_black\tCOeasy_black\tCO1easy_black\tCO2easy_black\tCOdiff_black\tCO1diff_black\tCO2diff_black\tCI_black\tCIeasy_black\tCIdiff_black\tlnRT_black\tlnRTeasy_black\tlnRTdiff_black\n');


for sub = 1 : length(subjects)
    
    subject = subjects{sub};
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
    pairsB = BlackChoiceBlocks(choice_Black, black_data);
    
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
        
    
    

     