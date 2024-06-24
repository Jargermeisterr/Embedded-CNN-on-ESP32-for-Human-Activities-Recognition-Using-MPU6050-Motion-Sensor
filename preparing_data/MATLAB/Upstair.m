%% Upstair1
clearvars
upstair1 = table2array(readtable("dataset\upstair\upstair_1.xlsx"));

o1_aX = upstair1(:,2);
o1_aY = upstair1(:,3);
o1_aZ = upstair1(:,4);
o1_gX = upstair1(:,5);
o1_gY = upstair1(:,6);
o1_gZ = upstair1(:,7);

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
sec_leng1 = length(upstair1)/200;  % total length of the record 
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

%% Upstair2
upstair2 = table2array(readtable("dataset\upstair\upstair_2.xlsx"));

o2_aX = upstair2(:,2);
o2_aY = upstair2(:,3);
o2_aZ = upstair2(:,4);
o2_gX = upstair2(:,5);
o2_gY = upstair2(:,6);
o2_gZ = upstair2(:,7);

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
sec_leng2 = length(upstair2)/200;  % total length of the record 
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

%% Upstair3
upstair3 = table2array(readtable("dataset\upstair\upstair_3.xlsx"));

o3_aX = upstair3(:,2);
o3_aY = upstair3(:,3);
o3_aZ = upstair3(:,4);
o3_gX = upstair3(:,5);
o3_gY = upstair3(:,6);
o3_gZ = upstair3(:,7);

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
sec_leng3 = length(upstair3)/200;  % total length of the record 
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

sample = sample1 + sample2 + sample3;
%% Save data
save_aX = [scale_sample1_aX; scale_sample2_aX; scale_sample3_aX];
save_aY = [scale_sample1_aY; scale_sample2_aY; scale_sample3_aY];
save_aZ = [scale_sample1_aZ; scale_sample2_aZ; scale_sample3_aZ];
save_gX = [scale_sample1_gX; scale_sample2_gX; scale_sample3_gX];
save_gY = [scale_sample1_gY; scale_sample2_gY; scale_sample3_gY];
save_gZ = [scale_sample1_gZ; scale_sample2_gZ; scale_sample3_gZ];

filename1 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\upstair\aX_upstair";
filename2 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\upstair\aY_upstair";
filename3 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\upstair\aZ_upstair";
filename4 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\upstair\gX_upstair";
filename5 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\upstair\gY_upstair";
filename6 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\upstair\gZ_upstair";

writematrix(save_aX, filename1);
writematrix(save_aY, filename2);
writematrix(save_aZ, filename3);
writematrix(save_gX, filename4);
writematrix(save_gY, filename5);
writematrix(save_gZ, filename6);

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



















