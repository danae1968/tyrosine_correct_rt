function[colormatrix,redmatrix,yellowmatrix,greenmatrix,bluematrix,purplematrix]=colormatrix()
color=struct();
numcolors=52;
for i=1:12
color(i).shade='red';
end

color(1).rgb=[128 0 0];
color(2).rgb=[165 0 0];
color(3).rgb=[165 42 42];
color(4).rgb=[178 34 34];
color(5).rgb=[220 20 60];
color(6).rgb=[255 0 0];
color(7).rgb=[255 99 71];
color(8).rgb=[255 127 80];
color(9).rgb=[205 92 92];
color(10).rgb=[255 69 0];
color(11).rgb=[255 140 0];
color(12).rgb=[255 165 0];

for i=12:17
color(i).shade='yellow';
end

color(13).rgb=[255 215 0];
color(14).rgb=[184 134 11];
color(15).rgb=[218 165 32];
color(16).rgb=[250 250 0];
color(17).rgb=[255 255 0];

for j=18:31
    color(i).shade='green';
end

color(18).rgb=[154 205 50];
color(19).rgb=[85 107 47];
color(20).rgb=[107 142 35];
color(21).rgb=[124 252 0];
color(22).rgb=[127 255 0];
color(23).rgb=[173 255 47];
color(24).rgb=[0 100 0];
color(25).rgb=[0 128 0];
color(26).rgb=[34 139 34];
color(27).rgb=[0 255 0];
color(28).rgb=[50 205 50];
color(29).rgb=[0 250 154];
color(30).rgb=[0 255 127];
color(31).rgb=[46 139 87];


for j=32:43
    color(i).shade='blue';
end

color(32).rgb=[47 79 79];
color(33).rgb=[0 128 128];
color(34).rgb=[0 139 139];
color(35).rgb=[0 255 255];
color(36).rgb=[0 250 250];
color(37).rgb=[0 206 209];
color(38).rgb=[0 191 255];
color(39).rgb=[25 25 112];
color(40).rgb=[0 0 128];
color(41).rgb=[0 0 139];
color(42).rgb=[0 0 205];
color(43).rgb=[0 0 225];


for j=44:52
    color(i).shade='purple';
end

color(44).rgb=[138 43 226];
color(45).rgb=[75 0 130];
color(46).rgb=[72 61 139];
color(47).rgb=[106 90 205];
color(48).rgb=[139 0 139];
color(49).rgb=[148 0 211];
color(50).rgb=[153 50 204];
color(51).rgb=[186 85 211];
color(52).rgb=[128 0 128];

cellcolor=struct2cell(color);
colorvector=cell2mat(cellcolor(2,:));
colormatrix=reshape(colorvector,[numcolors,3]);
redmatrix=colormatrix([1:12],:);
yellowmatrix=colormatrix([13:17],:);
greenmatrix=colormatrix([18:31],:);
bluematrix=colormatrix([32:43],:);
purplematrix=colormatrix([44:52],:);






