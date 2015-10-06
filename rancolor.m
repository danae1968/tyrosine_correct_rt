function rancolor
Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
crossLength=10;
crossColor=[200 90 0];
crossWidth=3;
 
crossLines=[-crossLength,0;crossLength,0; 0, -crossLength; 0, crossLength];
crossLines=crossLines';
xCenter=rect(3)/2;
yCenter=rect(4)/2;
 
s=rng;
rectOne=[600 600 700 700];
rectTwo=[400 400 500 500];
rectThree=[800 800 900 900];

rectOneX=2*(rect(3))/5;
rectOneY=(rect(4))/3;

rectTwoX=3*(rect(3))/5;
rectTwoY=2*(rect(4))/5;

rectThreeX=5*(rect(3))/9;
rectThreeY=5*(rect(4))/7;

rectOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);
rectTwo=CenterRectOnPoint(rectTwo,rectTwoX,rectTwoY);
rectThree=CenterRectOnPoint(rectThree,rectThreeX,rectThreeY);


for color=1:5
    color=randi(225,[3,3]);
    
allRects=[rectOne',rectTwo',rectThree'];
Screen('FillRect',wPtr,color,allRects);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
% WaitSecs(2);
KbStrokeWait;
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
end
clear Screen
end

% a=ChooseKFromN(225,3);
% Screen('Flip',wPtr);
% Screen('FillRect',wPtr,[a(i,:)],[400 400 500 500]);
% Screen('Flip',wPtr,1);
% rng(s);
% KbStrokeWait;
   


