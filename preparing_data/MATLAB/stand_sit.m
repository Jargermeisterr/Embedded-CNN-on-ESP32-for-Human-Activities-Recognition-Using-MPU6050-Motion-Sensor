%% stand_sit1
clearvars
stand_sit_array1 = table2array(readtable("dataset\stand-sit\stand-sit-1.xlsx"));

o1_aX = (stand_sit_array1(:,2) + 4)./8;
o1_aY = (stand_sit_array1(:,3) + 4)./8;
o1_aZ = (stand_sit_array1(:,4) + 4)./8;
o1_gX = (stand_sit_array1(:,5) + 2000)./4000;
o1_gY = (stand_sit_array1(:,6) + 2000)./4000;
o1_gZ = (stand_sit_array1(:,7) + 2000)./4000;

o1_aX = transpose(o1_aX); 
o1_aY = transpose(o1_aY);
o1_aZ = transpose(o1_aZ);
o1_gX = transpose(o1_gX);
o1_gY = transpose(o1_gY);
o1_gZ = transpose(o1_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;

sec_leng1 = length(stand_sit_array1)/200;
sample1 = sec_leng1/4;

for i = 1:sample1
    for j = 1:2
        if j == 1
            sample_aX_stand1(i, 1:200) = o1_aX(1,start:finish);
            sample_aY_stand1(i, 1:200) = o1_aY(1,start:finish);
            sample_aZ_stand1(i, 1:200) = o1_aZ(1,start:finish);
            sample_gX_stand1(i, 1:200) = o1_gX(1,start:finish);
            sample_gY_stand1(i, 1:200) = o1_gY(1,start:finish);
            sample_gZ_stand1(i, 1:200) = o1_gZ(1,start:finish);

            start = start + 600; % next sample
            finish = finish + 600;
        end

        if j == 2
            sample_aX_sit1(i, 1:200) = o1_aX(1,start:finish);
            sample_aY_sit1(i, 1:200) = o1_aY(1,start:finish);
            sample_aZ_sit1(i, 1:200) = o1_aZ(1,start:finish);
            sample_gX_sit1(i, 1:200) = o1_gX(1,start:finish);
            sample_gY_sit1(i, 1:200) = o1_gY(1,start:finish);
            sample_gZ_sit1(i, 1:200) = o1_gZ(1,start:finish);
        end        
    end
    start = start + 600; % next sample
    finish = finish + 600;
end

%% stand_sit2
stand_sit_array2 = table2array(readtable("dataset\stand-sit\stand-sit-2.xlsx"));

o2_aX = (stand_sit_array2(:,2) + 4)./8;
o2_aY = (stand_sit_array2(:,3) + 4)./8;
o2_aZ = (stand_sit_array2(:,4) + 4)./8;
o2_gX = (stand_sit_array2(:,5) + 2000)./4000;
o2_gY = (stand_sit_array2(:,6) + 2000)./4000;
o2_gZ = (stand_sit_array2(:,7) + 2000)./4000;

o2_aX = transpose(o2_aX); 
o2_aY = transpose(o2_aY);
o2_aZ = transpose(o2_aZ);
o2_gX = transpose(o2_gX);
o2_gY = transpose(o2_gY);
o2_gZ = transpose(o2_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;

sec_leng2 = length(stand_sit_array2)/200;
sample2 = sec_leng2/4 - 8;

for i = 1:sample2
    for j = 1:2
        if j == 1
            sample_aX_stand2(i, 1:200) = o2_aX(1,start:finish);
            sample_aY_stand2(i, 1:200) = o2_aY(1,start:finish);
            sample_aZ_stand2(i, 1:200) = o2_aZ(1,start:finish);
            sample_gX_stand2(i, 1:200) = o2_gX(1,start:finish);
            sample_gY_stand2(i, 1:200) = o2_gY(1,start:finish);
            sample_gZ_stand2(i, 1:200) = o2_gZ(1,start:finish);

            start = start + 600; % next sample
            finish = finish + 600;
        end

        if j == 2
            sample_aX_sit2(i, 1:200) = o2_aX(1,start:finish);
            sample_aY_sit2(i, 1:200) = o2_aY(1,start:finish);
            sample_aZ_sit2(i, 1:200) = o2_aZ(1,start:finish);
            sample_gX_sit2(i, 1:200) = o2_gX(1,start:finish);
            sample_gY_sit2(i, 1:200) = o2_gY(1,start:finish);
            sample_gZ_sit2(i, 1:200) = o2_gZ(1,start:finish);
        end        
    end
    start = start + 600; % next sample
    finish = finish + 600;
end

%% stand_sit3
stand_sit_array3 = table2array(readtable("dataset\stand-sit\stand-sit-3.xlsx"));

o3_aX = (stand_sit_array3(:,2) + 4)./8;
o3_aY = (stand_sit_array3(:,3) + 4)./8;
o3_aZ = (stand_sit_array3(:,4) + 4)./8;
o3_gX = (stand_sit_array3(:,5) + 2000)./4000;
o3_gY = (stand_sit_array3(:,6) + 2000)./4000;
o3_gZ = (stand_sit_array3(:,7) + 2000)./4000;

o3_aX = transpose(o3_aX); 
o3_aY = transpose(o3_aY);
o3_aZ = transpose(o3_aZ);
o3_gX = transpose(o3_gX);
o3_gY = transpose(o3_gY);
o3_gZ = transpose(o3_gZ);

% 1 window = 600 value (3s)
start = 1;
finish = 200;

sec_leng3 = length(stand_sit_array3)/200;
sample3 = sec_leng3/4 - 3;

for i = 1:sample3
    for j = 1:2
        if j == 1
            sample_aX_stand3(i, 1:200) = o3_aX(1,start:finish);
            sample_aY_stand3(i, 1:200) = o3_aY(1,start:finish);
            sample_aZ_stand3(i, 1:200) = o3_aZ(1,start:finish);
            sample_gX_stand3(i, 1:200) = o3_gX(1,start:finish);
            sample_gY_stand3(i, 1:200) = o3_gY(1,start:finish);
            sample_gZ_stand3(i, 1:200) = o3_gZ(1,start:finish);

            start = start + 600; % next sample
            finish = finish + 600;
        end

        if j == 2
            sample_aX_sit3(i, 1:200) = o3_aX(1,start:finish);
            sample_aY_sit3(i, 1:200) = o3_aY(1,start:finish);
            sample_aZ_sit3(i, 1:200) = o3_aZ(1,start:finish);
            sample_gX_sit3(i, 1:200) = o3_gX(1,start:finish);
            sample_gY_sit3(i, 1:200) = o3_gY(1,start:finish);
            sample_gZ_sit3(i, 1:200) = o3_gZ(1,start:finish);
        end        
    end
    start = start + 600; % next sample
    finish = finish + 600;
end

sample = sample1 + sample2 + sample3;

aX_stand = [sample_aX_stand1; sample_aX_stand2; sample_aX_stand3];
aY_stand = [sample_aY_stand1; sample_aY_stand2; sample_aY_stand3];
aZ_stand = [sample_aZ_stand1; sample_aZ_stand2; sample_aZ_stand3];
gX_stand = [sample_gX_stand1; sample_gX_stand2; sample_gX_stand3];
gY_stand = [sample_gY_stand1; sample_gY_stand2; sample_gY_stand3];
gZ_stand = [sample_gZ_stand1; sample_gZ_stand2; sample_gZ_stand3];

aX_sit = [sample_aX_sit1; sample_aX_sit2; sample_aX_sit3];
aY_sit = [sample_aY_sit1; sample_aY_sit2; sample_aY_sit3];
aZ_sit = [sample_aZ_sit1; sample_aZ_sit2; sample_aZ_sit3];
gX_sit = [sample_gX_sit1; sample_gX_sit2; sample_gX_sit3];
gY_sit = [sample_gY_sit1; sample_gY_sit2; sample_gY_sit3];
gZ_sit = [sample_gZ_sit1; sample_gZ_sit2; sample_gZ_sit3];

%% save data
filename1_stand = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\stand\aX_stand";
filename2_stand = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\stand\aY_stand";
filename3_stand = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\stand\aZ_stand";
filename4_stand = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\stand\gX_stand";
filename5_stand = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\stand\gY_stand";
filename6_stand = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\stand\gZ_stand";

writematrix(aX_stand, filename1_stand);
writematrix(aY_stand, filename2_stand);
writematrix(aZ_stand, filename3_stand);
writematrix(gX_stand, filename4_stand);
writematrix(gY_stand, filename5_stand);
writematrix(gZ_stand, filename6_stand);

filename1_sit = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\sit\aX_sit";
filename2_sit = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\sit\aY_sit";
filename3_sit = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\sit\aZ_sit";
filename4_sit = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\sit\gX_sit";
filename5_sit = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\sit\gY_sit";
filename6_sit = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\sit\gZ_sit";

writematrix(aX_sit, filename1_sit);
writematrix(aY_sit, filename2_sit);
writematrix(aZ_sit, filename3_sit);
writematrix(gX_sit, filename4_sit);
writematrix(gY_sit, filename5_sit);
writematrix(gZ_sit, filename6_sit);

%% Plot
% stand-sit1
row = 10;
figure('Name','Stand1')
for r = 1:row
    subplot(row,1,r)
    plot(sample_gX_stand1(r,:));
    hold;
    plot(sample_gY_stand1(r,:));
    plot(sample_gZ_stand1(r,:));
end
figure('Name','Sit1')
for r = 1:row
    subplot(row,1,r)
    plot(sample_gX_sit1(r,:));
    hold;
    plot(sample_gY_sit1(r,:));
    plot(sample_gZ_sit1(r,:));
end

% stand-sit2
figure('Name','Stand2')
for r = 1:row
    subplot(row,1,r)
    plot(sample_gX_stand1(r,:));
    hold;
    plot(sample_gY_stand1(r,:));
    plot(sample_gZ_stand1(r,:));
end
figure('Name','Sit2')
for r = 1:row
    subplot(row,1,r)
    plot(sample_gX_sit1(r,:));
    hold;
    plot(sample_gY_sit1(r,:));
    plot(sample_gZ_sit1(r,:));
end

% stand-sit3
figure('Name','Stand3')
for r = 1:row
    subplot(row,1,r)
    plot(sample_gX_stand3(r,:));
    hold;
    plot(sample_gY_stand3(r,:));
    plot(sample_gZ_stand3(r,:));
end
figure('Name','Sit3')
for r = 1:row
    subplot(row,1,r)
    plot(sample_gX_sit3(r,:));
    hold;
    plot(sample_gY_sit3(r,:));
    plot(sample_gZ_sit3(r,:));
end


















