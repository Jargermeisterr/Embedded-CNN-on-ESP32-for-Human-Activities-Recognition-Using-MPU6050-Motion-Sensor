%% none
clearvars
none1 = table2array(readtable("dataset\none\none.xlsx"));

o1_aX = none1(:,2);
o1_aY = none1(:,3);
o1_aZ = none1(:,4);
o1_gX = none1(:,5);
o1_gY = none1(:,6);
o1_gZ = none1(:,7);

o1_aX = transpose(o1_aX); 
o1_aY = transpose(o1_aY);
o1_aZ = transpose(o1_aZ);
o1_gX = transpose(o1_gX);
o1_gY = transpose(o1_gY);
o1_gZ = transpose(o1_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;
% stride = 100 value (0.5s)
sec_leng1 = length(none1)/200;  % total length of the record 
sample1 = (sec_leng1 - 1) * 2 + 1;

for i = 1:sample1
    sample1_aX(i, 1:200) = o1_aX(1,start:finish);
    sample1_aY(i, 1:200) = o1_aY(1,start:finish);
    sample1_aZ(i, 1:200) = o1_aZ(1,start:finish);
    sample1_gX(i, 1:200) = o1_gX(1,start:finish);
    sample1_gY(i, 1:200) = o1_gY(1,start:finish);
    sample1_gZ(i, 1:200) = o1_gZ(1,start:finish);

    start = start + 100;
    finish = finish + 100;
end

% Scaling
scale_sample1_aX = (sample1_aX + 4)./8;
scale_sample1_aY = (sample1_aY + 4)./8;
scale_sample1_aZ = (sample1_aZ + 4)./8;
scale_sample1_gX = (sample1_gX + 2000)./4000;
scale_sample1_gY = (sample1_gY + 2000)./4000;
scale_sample1_gZ = (sample1_gZ + 2000)./4000;

%% Save data
save_aX = scale_sample1_aX;
save_aY = scale_sample1_aY;
save_aZ = scale_sample1_aZ;
save_gX = scale_sample1_gX;
save_gY = scale_sample1_gY;
save_gZ = scale_sample1_gZ;

filename1 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\none\aX_none";
filename2 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\none\aY_none";
filename3 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\none\aZ_none";
filename4 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\none\gX_none";
filename5 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\none\gY_none";
filename6 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\none\gZ_none";

writematrix(save_aX, filename1);
writematrix(save_aY, filename2);
writematrix(save_aZ, filename3);
writematrix(save_gX, filename4);
writematrix(save_gY, filename5);
writematrix(save_gZ, filename6);