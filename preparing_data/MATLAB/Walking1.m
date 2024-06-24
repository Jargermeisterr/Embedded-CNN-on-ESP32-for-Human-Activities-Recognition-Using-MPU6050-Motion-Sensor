%% walking1
clearvars
walking1 = table2array(readtable("dataset\walking\walking_1.xlsx"));

o1_aX = walking1(:,2);
o1_aY = walking1(:,3);
o1_aZ = walking1(:,4);
o1_gX = walking1(:,5);
o1_gY = walking1(:,6);
o1_gZ = walking1(:,7);

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
sec_leng1 = length(walking1)/200;  % total length of the record 
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

%% walking2
walking2 = table2array(readtable("dataset\walking\walking_2.xlsx"));

o2_aX = walking2(:,2);
o2_aY = walking2(:,3);
o2_aZ = walking2(:,4);
o2_gX = walking2(:,5);
o2_gY = walking2(:,6);
o2_gZ = walking2(:,7);

o2_aX = transpose(o2_aX); 
o2_aY = transpose(o2_aY);
o2_aZ = transpose(o2_aZ);
o2_gX = transpose(o2_gX);
o2_gY = transpose(o2_gY);
o2_gZ = transpose(o2_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;
% stride = 100 value (0.5s)
sec_leng2 = length(walking2)/200;  % total length of the record 
sample2 = (sec_leng2 - 1) * 2 + 1;

for i = 1:sample2
    sample2_aX(i, 1:200) = o2_aX(1,start:finish);
    sample2_aY(i, 1:200) = o2_aY(1,start:finish);
    sample2_aZ(i, 1:200) = o2_aZ(1,start:finish);
    sample2_gX(i, 1:200) = o2_gX(1,start:finish);
    sample2_gY(i, 1:200) = o2_gY(1,start:finish);
    sample2_gZ(i, 1:200) = o2_gZ(1,start:finish);

    start = start + 100;
    finish = finish + 100;
end

% Scaling
scale_sample2_aX = (sample2_aX + 4)./8;
scale_sample2_aY = (sample2_aY + 4)./8;
scale_sample2_aZ = (sample2_aZ + 4)./8;
scale_sample2_gX = (sample2_gX + 2000)./4000;
scale_sample2_gY = (sample2_gY + 2000)./4000;
scale_sample2_gZ = (sample2_gZ + 2000)./4000;

%% walking3
walking3 = table2array(readtable("dataset\walking\walking_3.xlsx"));

o3_aX = walking3(:,2);
o3_aY = walking3(:,3);
o3_aZ = walking3(:,4);
o3_gX = walking3(:,5);
o3_gY = walking3(:,6);
o3_gZ = walking3(:,7);

o3_aX = transpose(o3_aX); 
o3_aY = transpose(o3_aY);
o3_aZ = transpose(o3_aZ);
o3_gX = transpose(o3_gX);
o3_gY = transpose(o3_gY);
o3_gZ = transpose(o3_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;
% stride = 100 value (0.5s)
sec_leng3 = length(walking3)/200;  % total length of the record 
sample3 = (sec_leng3 - 1) * 2 + 1;

for i = 1:sample3
    sample3_aX(i, 1:200) = o3_aX(1,start:finish);
    sample3_aY(i, 1:200) = o3_aY(1,start:finish);
    sample3_aZ(i, 1:200) = o3_aZ(1,start:finish);
    sample3_gX(i, 1:200) = o3_gX(1,start:finish);
    sample3_gY(i, 1:200) = o3_gY(1,start:finish);
    sample3_gZ(i, 1:200) = o3_gZ(1,start:finish);

    start = start + 100;
    finish = finish + 100;
end

% Scaling
scale_sample3_aX = (sample3_aX + 4)./8;
scale_sample3_aY = (sample3_aY + 4)./8;
scale_sample3_aZ = (sample3_aZ + 4)./8;
scale_sample3_gX = (sample3_gX + 2000)./4000;
scale_sample3_gY = (sample3_gY + 2000)./4000;
scale_sample3_gZ = (sample3_gZ + 2000)./4000;

%% walking4
walking4 = table2array(readtable("dataset\walking\walking_4.xlsx"));

o4_aX = walking4(:,2);
o4_aY = walking4(:,3);
o4_aZ = walking4(:,4);
o4_gX = walking4(:,5);
o4_gY = walking4(:,6);
o4_gZ = walking4(:,7);

o4_aX = transpose(o4_aX); 
o4_aY = transpose(o4_aY);
o4_aZ = transpose(o4_aZ);
o4_gX = transpose(o4_gX);
o4_gY = transpose(o4_gY);
o4_gZ = transpose(o4_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;
% stride = 100 value (0.5s)
sec_leng4 = length(walking4)/200;  % total length of the record 
sample4 = (sec_leng4 - 1) * 2 + 1;

for i = 1:sample4
    sample4_aX(i, 1:200) = o4_aX(1,start:finish);
    sample4_aY(i, 1:200) = o4_aY(1,start:finish);
    sample4_aZ(i, 1:200) = o4_aZ(1,start:finish);
    sample4_gX(i, 1:200) = o4_gX(1,start:finish);
    sample4_gY(i, 1:200) = o4_gY(1,start:finish);
    sample4_gZ(i, 1:200) = o4_gZ(1,start:finish);

    start = start + 100;
    finish = finish + 100;
end

% Scaling
scale_sample4_aX = (sample4_aX + 4)./8;
scale_sample4_aY = (sample4_aY + 4)./8;
scale_sample4_aZ = (sample4_aZ + 4)./8;
scale_sample4_gX = (sample4_gX + 2000)./4000;
scale_sample4_gY = (sample4_gY + 2000)./4000;
scale_sample4_gZ = (sample4_gZ + 2000)./4000;

%% walking5
walking5 = table2array(readtable("dataset\walking\walking_5.xlsx"));

o5_aX = walking5(:,2);
o5_aY = walking5(:,3);
o5_aZ = walking5(:,4);
o5_gX = walking5(:,5);
o5_gY = walking5(:,6);
o5_gZ = walking5(:,7);

o5_aX = transpose(o5_aX); 
o5_aY = transpose(o5_aY);
o5_aZ = transpose(o5_aZ);
o5_gX = transpose(o5_gX);
o5_gY = transpose(o5_gY);
o5_gZ = transpose(o5_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;
% stride = 100 value (0.5s)
sec_leng5 = length(walking5)/200;  % total length of the record 
sample5 = (sec_leng5 - 1) * 2 + 1;

for i = 1:sample5
    sample5_aX(i, 1:200) = o5_aX(1,start:finish);
    sample5_aY(i, 1:200) = o5_aY(1,start:finish);
    sample5_aZ(i, 1:200) = o5_aZ(1,start:finish);
    sample5_gX(i, 1:200) = o5_gX(1,start:finish);
    sample5_gY(i, 1:200) = o5_gY(1,start:finish);
    sample5_gZ(i, 1:200) = o5_gZ(1,start:finish);

    start = start + 100;
    finish = finish + 100;
end

% Scaling
scale_sample5_aX = (sample5_aX + 4)./8;
scale_sample5_aY = (sample5_aY + 4)./8;
scale_sample5_aZ = (sample5_aZ + 4)./8;
scale_sample5_gX = (sample5_gX + 2000)./4000;
scale_sample5_gY = (sample5_gY + 2000)./4000;
scale_sample5_gZ = (sample5_gZ + 2000)./4000;

%% Plot data
figure
plot(scale_sample1_aX(2,:));
hold;
plot(scale_sample1_aY(2,:));
plot(scale_sample1_aZ(2,:));

figure
plot(scale_sample1_gX(2,:));
hold;
plot(scale_sample1_gY(2,:));
plot(scale_sample1_gZ(2,:));

%% Save data
save_aX = [scale_sample1_aX; scale_sample2_aX; scale_sample3_aX; scale_sample4_aX; scale_sample5_aX];
save_aY = [scale_sample1_aY; scale_sample2_aY; scale_sample3_aY; scale_sample4_aY; scale_sample5_aY];
save_aZ = [scale_sample1_aZ; scale_sample2_aZ; scale_sample3_aZ; scale_sample4_aZ; scale_sample5_aZ];
save_gX = [scale_sample1_gX; scale_sample2_gX; scale_sample3_gX; scale_sample4_gX; scale_sample5_gX];
save_gY = [scale_sample1_gY; scale_sample2_gY; scale_sample3_gY; scale_sample4_gY; scale_sample5_aY];
save_gZ = [scale_sample1_gZ; scale_sample2_gZ; scale_sample3_gZ; scale_sample4_gZ; scale_sample5_gZ];

filename1 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\walking\aX_walking";
filename2 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\walking\aY_walking";
filename3 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\walking\aZ_walking";
filename4 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\walking\gX_walking";
filename5 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\walking\gY_walking";
filename6 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\walking\gZ_walking";

writematrix(save_aX, filename1);
writematrix(save_aY, filename2);
writematrix(save_aZ, filename3);
writematrix(save_gX, filename4);
writematrix(save_gY, filename5);
writematrix(save_gZ, filename6);





