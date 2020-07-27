function [rate] = ratings(subject, ratings_file, rate1_data,rate2_data)

rate = zeros(length(rate1_data),3);

    % generate ratings data

    fid3 = fopen(ratings_file, 'w');
    fprintf(fid3,'subject\tImage\tRating\tNV\n');
    
    for im = 1:length(rate1_data)
        img = rate1_data(im,2);
        
        if img == 0
            rating = 1;
        else
            
           j = find(rate2_data(:,2)==img);
           if isempty(j) 
                 rating = rate1_data(im,3);
                 rating_diff = 0;              
                 
           else           
               rating = (rate2_data(j,3) + rate1_data(im,3))/2;
               rating_diff = abs(rate2_data(j,3)- rate1_data(im,3));            

           end
        end
        
        fprintf(fid3,'%s\t%f\t%f\t%f\n',subject,img,rating,rating_diff);
        rate(im,:) = [img, rating, rating_diff];  
    end
    fclose(fid3);
end