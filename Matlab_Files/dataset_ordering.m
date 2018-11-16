clc;clear all; close all;
tic

%Questions BURAK: 
% 1-) Grid type has only one unique value so it has to be extracted, double check please
% 2-) I believe game ID style data might not be effective in decision maybe
% these have to be extracted
% 3-) We should add headers to the latest file, it will be better for
% python




% T1 = readtable('all_chart_2013.csv');
% T2 = readtable('all_shots_2013.csv');
T = readtable('joined_shots_2013.csv');


var_1_unique=unique(T.(1),'stable');
closest_defender_id_unique=unique(T.(3),'stable');
closest_defender_dist_unique=unique(T.(4),'stable');
dribble_unique=unique(T.(5),'stable');
fgm_unique=unique(T.(6),'stable');
final_margin_unique=unique(T.(7),'stable');
game_clock_unique=unique(T.(8),'stable');
game_id_unique=unique(T.(9),'stable');
% game_id_1_unique=unique(T.(10),'stable');
game_location=unique(T.(11),'stable');
matchup_unique=unique(T.(12),'stable');
period_unique=unique(T.(13),'stable');
pts_unique=unique(T.(15),'stable');
pts_type_unique=unique(T.(16),'stable');
shot_clock_unique=unique(T.(17),'stable');
shot_dist_unique=unique(T.(18),'stable');
shot_number_unique=unique(T.(19),'stable');
shot_result_unique=unique(T.(20),'stable');
touch_time_unique=unique(T.(21),'stable');
win_loss_unique=unique(T.(22),'stable');

grid_type_unique=unique(T.(23),'stable');
% game_id_unique=unique(T.(24),'stable');
game_event_id_unique=unique(T.(24),'stable');
player_id_unique=unique(T.(26),'stable');
team_id_unique=unique(T.(28),'stable');
% period_unique=unique(T.(29),'stable');
minutes_remaining_unique=unique(T.(29),'stable');
seconds_remaining_unique=unique(T.(30),'stable');


event_type_unique=unique(T.(31),'stable');
action_type_unique=unique(T.(32),'stable');
shot_type_unique=unique(T.(33),'stable');
shot_zone_basic_unique=unique(T.(34),'stable');
shot_zone_area_unique=unique(T.(35),'stable');
shot_zone_range_unique=unique(T.(36),'stable');


shot_distance_unique=unique(T.(37),'stable');
loc_x_unique=unique(T.(38),'stable');
loc_y_unique=unique(T.(39),'stable');
shot_attempted_flag_unique=unique(T.(40),'stable');
shot_made_flag_unique=unique(T.(41),'stable');


num_ordered_features=zeros(length(T.(1)),36);

a=1;
for i=[1 3 4 5 6 7 8 9 11 12 13 15 16 17 18 19 20 21 22 23 24 26 ...
        28 29 30 31 32 33 34 35 36 37 38 39 40 41]

    if iscell(T.(i))
    s=string(T.(i));
    u=unique(T.(i),'stable');
    
    for j=1:length(T.(1))
    num_ordered_features(j,a)=find(u==s(j));
    end  
        
    else
    num_ordered_features(:,a)=T.(i);
    end
    
    a=a+1;
end


% Writing output as a csv file and setting NaN values to -1 

num_ordered_features(isnan(num_ordered_features)) = -1; 
csvwrite('joined_shots_updated2013.csv',num_ordered_features);


toc