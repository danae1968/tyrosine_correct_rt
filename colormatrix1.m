Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);

[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
HideCursor;
rectOne=[0 0 100 100];

rectOneX=2*(rect(3))/5;   %rect locations
rectOneY=(rect(4))/3;

rectTwoX=3*(rect(3))/5;
rectTwoY=2*(rect(4))/5;

rectThreeX=5*(rect(3))/9;
rectThreeY=5*(rect(4))/7;

rectFourX=0.4*(rect(3));
rectFourY=5*(rect(4))/8;

rectOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);  %places rects on location we want
rectTwo=CenterRectOnPoint(rectOne,rectTwoX,rectTwoY);
rectThree=CenterRectOnPoint(rectOne,rectThreeX,rectThreeY);
rectFour=CenterRectOnPoint(rectOne,rectFourX,rectFourY);
allRects=[rectOne',rectTwo',rectThree',rectFour'];

bluematrix=zeros(15,3);

for j=1:length(bluematrix)
bluematrix(j,2)=randi([0,120],1);
bluematrix(j,3)=randi([120,225],1);
end
 
bluematrix=bluematrix';

greenmatrix=zeros(15,3);

for j=1:length(greenmatrix)
greenmatrix(j,1)=randi([0,30],1);
greenmatrix(j,2)=randi([150,225],1);
greenmatrix(j,3)=randi([0,30],1);
end
 
greenmatrix=greenmatrix';

redmatrix=zeros(15,3);

for j=1:length(redmatrix)
redmatrix(j,1)=randi([130,225],1);
redmatrix(j,3)=randi([0,50],1);
end
 
redmatrix=redmatrix';


yellowmatrix=zeros(15,3);

for i=1:length(redmatrix)

Screen('FillRect',wPtr,redmatrix(:,i),rectOne');
Screen('Flip',wPtr);
KbStrokeWait;
end
clear Screen