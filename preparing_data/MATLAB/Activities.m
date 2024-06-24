clearvars;

aX_walking = readmatrix("dataset\walking\aX_walking.txt");
aY_walking = readmatrix("dataset\walking\aY_walking.txt");
aZ_walking = readmatrix("dataset\walking\aZ_walking.txt");
gX_walking = readmatrix("dataset\walking\gX_walking.txt");
gY_walking = readmatrix("dataset\walking\gY_walking.txt");
gZ_walking = readmatrix("dataset\walking\gZ_walking.txt");

aX_upstair = readmatrix("dataset\upstair\aX_upstair.txt");
aY_upstair = readmatrix("dataset\upstair\aY_upstair.txt");
aZ_upstair = readmatrix("dataset\upstair\aZ_upstair.txt");
gX_upstair = readmatrix("dataset\upstair\gX_upstair.txt");
gY_upstair = readmatrix("dataset\upstair\gY_upstair.txt");
gZ_upstair = readmatrix("dataset\upstair\gZ_upstair.txt");

aX_stand = readmatrix("dataset\stand\aX_stand.txt");
aY_stand = readmatrix("dataset\stand\aY_stand.txt");
aZ_stand = readmatrix("dataset\stand\aZ_stand.txt");
gX_stand = readmatrix("dataset\stand\gX_stand.txt");
gY_stand = readmatrix("dataset\stand\gY_stand.txt");
gZ_stand = readmatrix("dataset\stand\gZ_stand.txt");

aX_sit = readmatrix("dataset\sit\aX_sit.txt");
aY_sit = readmatrix("dataset\sit\aY_sit.txt");
aZ_sit = readmatrix("dataset\sit\aZ_sit.txt");
gX_sit = readmatrix("dataset\sit\gX_sit.txt");
gY_sit = readmatrix("dataset\sit\gY_sit.txt");
gZ_sit = readmatrix("dataset\sit\gZ_sit.txt");

aX_none = readmatrix("dataset\none\aX_none.txt");
aY_none = readmatrix("dataset\none\aY_none.txt");
aZ_none = readmatrix("dataset\none\aZ_none.txt");
gX_none = readmatrix("dataset\none\gX_none.txt");
gY_none = readmatrix("dataset\none\gY_none.txt");
gZ_none = readmatrix("dataset\none\gZ_none.txt");

aX_all = [aX_walking; aX_upstair; aX_stand; aX_sit; aX_none];
aY_all = [aY_walking; aY_upstair; aY_stand; aY_sit; aY_none];
aZ_all = [aZ_walking; aZ_upstair; aZ_stand; aZ_sit; aZ_none];
gX_all = [gX_walking; gX_upstair; gX_stand; gX_sit; gX_none];
gY_all = [gY_walking; gY_upstair; gY_stand; gY_sit; gY_none];
gZ_all = [gZ_walking; gZ_upstair; gZ_stand; gZ_sit; gZ_none];
%% Save data
filename1 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\aX_all";
filename2 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\aY_all";
filename3 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\aZ_all";
filename4 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\gX_all";
filename5 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\gY_all";
filename6 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\gZ_all";

writematrix(aX_all, filename1);
writematrix(aY_all, filename2);
writematrix(aZ_all, filename3);
writematrix(gX_all, filename4);
writematrix(gY_all, filename5);
writematrix(gZ_all, filename6);

%% labels
walking = 577;
upstair = 199;
none    = 407;
stand   = 78;
sit     = 77;

walk    = [];
ups     = [];
non     = [];
st      = [];
si      = [];

for i = 1:walking
    walk = [walk; 1];
end

for i = 1:upstair
    ups = [ups; 2];
end

for i = 1:stand
    st = [st; 3];
end

for i = 1:sit
    si = [si; 4];
end

for i = 1:none
    non = [non; 5];
end
labels = [walk; ups; st; si; non];
%% save labels


filename7 = "F:\PC\Nam_3\HK2\DO_AN_2\preparing_data\MATLAB\dataset\labels.txt";
writematrix(labels, filename7);









