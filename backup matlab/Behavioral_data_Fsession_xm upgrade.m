clear all
clc

% input files
path = '/Users/xiaoma/Box/PVDM/Matlab_code/finput';
pathRf = '/Users/xiaoma/Box/PVDM/Matlab_code/output/fmri_c_ratings/';
pathHf = '/Users/xiaoma/Box/PVDM/Matlab_code/output/fmri_c_hddm/';
pathEf = '/Users/xiaoma/Box/PVDM/Matlab_code/output/fmri_c_eye/';

%choice 114, 120, 203, 213 missing
%201, 206, is wrong, 36 run, 6 weird

% input files
% subjects= xlsread('input\All_subjects.xlsx'); 
% [black_data, black_text]= xlsread('input\Bratings.xlsx');

subjects = {'103','104', '105', '106', '110', '111', '113', '116', '117', '118', '121', '124', '126', '130', ...
          '202', '204', '207', '210', '211', '212', '214', '215', '218', '222', '223', '224', '225', '226', ...
          '227', '228', '229', '230', '232', '233', '264', '296', '297'};

choice = {'/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_103.xlsx','/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_104.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_105.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_106.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_110.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_111.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_113.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_116.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_117.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_118.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_121.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_124.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_126.xlsx',  '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_130.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_202.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_204.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_207.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_210.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_211.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_212.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_214.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_215.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_218.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_222.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_223.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_224.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_225.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_226.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_227.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_228.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_229.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_230.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_232.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_233.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_264.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_296.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/choice_f_297.xlsx'};
      

 rate1 = {'/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_103.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_104.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_105.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_106.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_110.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_111.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_113.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_116.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_117.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_118.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_121.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_124.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_126.xlsx',  '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_130.xlsx', ...
         '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_202.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_204.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_207.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_210.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_211.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_212.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_214.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_215.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_218.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_222.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_223.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_224.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_225.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_226.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_227.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_228.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_229.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_230.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_232.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_233.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_264.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_296.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate1_297.xlsx'};
      

rate2 = {'/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_103.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_104.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_105.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_106.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_110.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_111.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_113.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_116.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_117.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_118.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_121.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_124.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_126.xlsx',  '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_130.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_202.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_204.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_207.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_210.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_211.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_212.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_214.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_215.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_218.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_222.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_223.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_224.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_225.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_226.xlsx', ...
          '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_227.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_228.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_229.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_230.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_232.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_233.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_264.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_296.xlsx', '/Users/xiaoma/Box/PVDM/Matlab_code/finput/frate2_297.xlsx'};
      



[black_data, black_text]= xlsread('/Users/xiaoma/Box/PVDM/Matlab_code/finput/Bratings.xlsx');

% results files
results_file = 'Choice_indecies_Fsession.txt';
fid2 = fopen(results_file,'w');
fprintf(fid2,'subject\tNV\tNVvar\tCO_like\tCOeasy_like\tCOdiff_like\tlnRT_like\tlnRTeasy_like\tlnRTdiff_like\tCO_black\tCOeasy_black\tCOdiff_black\tlnRT_black\tlnRTeasy_black\tlnRTdiff_black\n');


for sub = 1 : length(subjects)
    
    subject = subjects{sub};
    fprintf('  Subject %s\n',subject)
    
   %extract subject's data
    file_choice = char(choice(sub));
    [choice_data, choice_text]= xlsread(file_choice); %choice
    
    file_rate1 = char(rate1(sub));
    [rate1_data, rate1_text]= xlsread(file_rate1); %rating 1
    
    file_rate2 = char(rate2(sub));
    [rate2_data, rate2_text]= xlsread(file_rate2); %rating 2
    
    rate = zeros(length(rate1_data),3);  
    
   % generate ratings data
    ratings_file = [pathRf subject '_f_ratings.txt'];
    rate = ratings(subject, ratings_file, rate1_data, rate2_data);
    
   % Extracting choices from Like blocks
    Index0 = strfind(choice_text(:,3),'ChooseLike');
    Index = find(not(cellfun('isempty',Index0)))-1;
    choice_Like = choice_data(Index,:);
    pairsL = fLikeChoiceBlocks(choice_Like, rate);
    
   % Extracting choices from Black blocks
    Index0B = strfind(choice_text(:,3),'ChooseBlack');
    IndexB = find(not(cellfun('isempty',Index0B)))-1;
    choice_Black = choice_data(IndexB,:);
    pairsB = fBlackChoiceBlocks(choice_Black, black_data);
    
   % generate descriptives of pairs from Black blocks
    choice_Black1 = choice_Black(1:51,:);
    choice_Black2 = choice_Black(52:102, :);
       
   
   % Generating choice data statistics for the subject 
   % Like blocks
     nv_images = zeros(length (rate2_data),1);
     for k = 1: length (rate2_data)
         nv_image(k) = find(rate(:,1) == rate2_data(k,2));
     end
          
     NV = mean(rate(nv_image,3));    
     NVvar = var(rate(nv_image,3));    

     COL = mean(pairsL(:,8));
     lnRTL = mean(pairsL(find((pairsL(:,9)<2) & (pairsL(:,9)> -2)),9));
    
   % Generating choice data statistics for easy and difficult pairs for the subject
     easy_pairsL = pairsL(find(pairsL(:,7)==0),:);
     diff_pairsL = pairsL(find(pairsL(:,7)==1),:);
    
     CO_easyL = mean(easy_pairsL(:,8));
     CO_diffL = mean(diff_pairsL(:,8));

    
     lnRT_easyL = mean(easy_pairsL(find((easy_pairsL(:,9)<2) & (easy_pairsL(:,9)> -2)),9));
     lnRT_diffL = mean(diff_pairsL(find((diff_pairsL(:,9)<2) & (diff_pairsL(:,9)> -2)),9));
     
    % Black blocks
     COB = mean(pairsB(:,8));


     lnRTB = mean(pairsB(find((pairsL(:,9)<2) & (pairsL(:,9)> -2)),9));
    
   % Generating choice data statistics for easy and difficult pairs for the subject
     easy_pairsB = pairsL(find(pairsB(:,7)==0),:);
     diff_pairsB = pairsL(find(pairsB(:,7)==1),:);
    
     CO_easyB = mean(easy_pairsB(:,8));
     CO_diffB = mean(diff_pairsB(:,8));
      
     
     lnRT_easyB = mean(easy_pairsB(find((easy_pairsB(:,9)<2) & (easy_pairsB(:,9)> -2)),9));
     lnRT_diffB = mean(diff_pairsB(find((diff_pairsB(:,9)<2) & (diff_pairsB(:,9)> -2)),9));
     
   % Printing choice data summary statistics  for the subject 
    fprintf(fid2,'%s\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n',...
            subject, NV, NVvar, COL, CO_easyL, CO_diffL, lnRTL, lnRT_easyL, lnRT_diffL, COB, CO_easyB, CO_diffB, lnRTB, lnRT_easyB, lnRT_diffB);
    
   % Generate inputs for hddm analyses for the subject
    hddm = fhddm_input(sub, choice_data, choice_text, black_data, black_text, rate);
    hddm_Xfile = [pathHf  subject '_f_hddm.xlsx'];
    hddm_file = [pathHf  subject '_f_hddm.csv'];
    writetable(hddm,hddm_Xfile,'Sheet',1,'Range','A1');
    writetable(hddm,hddm_file);
    
end
fclose(fid2);
        
    
    

     