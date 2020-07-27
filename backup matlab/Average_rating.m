clear all
clc
% input files

path = 'C:\Users\hp245\Data_Analysis\PVDM\';
pathR = 'C:\Users\hp245\Data_Analysis\PVDM\ratings\';
pathH = 'C:\Users\hp245\Data_Analysis\PVDM\hddm\';
pathE = 'C:\Users\hp245\Data_Analysis\PVDM\eye\';

subjects = {'101', '102', '103', '104', '105', '106', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '120', '122', '123', '130', ...
            '201', '202', '203', '204', '206', '207', '209', '210', '212', '214', '215', '216', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '264' };


rating = { 'ratings\101_ratings.xlsx', 'ratings\102_ratings.xlsx', 'ratings\103_ratings.xlsx', 'ratings\104_ratings.xlsx', 'ratings\105_ratings.xlsx', 'ratings\106_ratings.xlsx', 'ratings\108_ratings.xlsx', ...
          'ratings\109_ratings.xlsx', 'ratings\110_ratings.xlsx', 'ratings\111_ratings.xlsx', 'ratings\112_ratings.xlsx', 'ratings\113_ratings.xlsx', 'ratings\114_ratings.xlsx', 'ratings\115_ratings.xlsx', ...
          'ratings\116_ratings.xlsx', 'ratings\117_ratings.xlsx', 'ratings\118_ratings.xlsx', 'ratings\120_ratings.xlsx', 'ratings\122_ratings.xlsx', 'ratings\123_ratings.xlsx', 'ratings\130_ratings.xlsx', ...
          'ratings\201_ratings.xlsx', 'ratings\202_ratings.xlsx', 'ratings\203_ratings.xlsx', 'ratings\204_ratings.xlsx', 'ratings\206_ratings.xlsx', 'ratings\207_ratings.xlsx', 'ratings\209_ratings.xlsx', ...
          'ratings\210_ratings.xlsx', 'ratings\212_ratings.xlsx', 'ratings\214_ratings.xlsx', 'ratings\215_ratings.xlsx', 'ratings\216_ratings.xlsx', 'ratings\218_ratings.xlsx', 'ratings\219_ratings.xlsx', ...
          'ratings\220_ratings.xlsx', 'ratings\221_ratings.xlsx', 'ratings\222_ratings.xlsx', 'ratings\223_ratings.xlsx', 'ratings\224_ratings.xlsx', 'ratings\225_ratings.xlsx', 'ratings\226_ratings.xlsx', ...
          'ratings\227_ratings.xlsx', 'ratings\264_ratings.xlsx' };

        
 ave_rate = zeros(121, length(subjects));


for sub = 1 : length(subjects)
    
    subject = subjects{sub};
    fprintf('  Subject %s\n',subject)
    
    %extract subject's data
    file_rating = char(rating(sub));
    [rating_data, rating_text]= xlsread(file_rating);
    
    ave_rate (:,sub) = rating_data(:, 3);
end

average_rating = table(rating_data(:, 2), mean(ave_rate,2));
average_rating_Xfile = [pathR  'average_rating.xlsx'];
writetable(average_rating,average_rating_Xfile,'Sheet',1,'Range','A1');


    