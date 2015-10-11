function rancolor2
Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);

[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));

crossLength=10;
crossColor=[200 0 200];    %fixation cross features
crossWidth=3;
 
crossLines=[-crossLength,0;crossLength,0; 0, -crossLength; 0, crossLength];
crossLines=crossLines';
xCenter=rect(3)/2;              %fixation cross location
yCenter=rect(4)/2;
 
% s=rng;
rectOne=[600 600 700 700];
rectTwo=[400 400 500 500];
rectThree=[800 800 900 900];         %rect size
rectFour=[800 800 900 900];

rectOneX=2*(rect(3))/5;   %rect locations
rectOneY=(rect(4))/3;

rectTwoX=3*(rect(3))/5;
rectTwoY=2*(rect(4))/5;

rectThreeX=5*(rect(3))/9;
rectThreeY=5*(rect(4))/7;

rectFourX=0.4*(rect(3));
rectFourY=5*(rect(4))/8;

rectOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);  %places rects on location we want
rectTwo=CenterRectOnPoint(rectTwo,rectTwoX,rectTwoY);
rectThree=CenterRectOnPoint(rectThree,rectThreeX,rectThreeY);
rectFour=CenterRectOnPoint(rectFour,rectFourX,rectFourY);

% color1=randi(225,[3,3]);
% color2=randi(225,[3,3]);

color=zeros(3,16);
shades = randi(255,[3,16]);

for i=1:3:13
 color=shades(:,(i:i+3));
 
% Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA); 

% Screen('Flip',wPtr);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);

allRects=[rectOne',rectTwo',rectThree',rectFour'];
Screen('FillRect',wPtr,color,allRects);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);
% KbStrokeWait;

% Screen('Flip',wPtr);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
% Screen('Flip',wPtr);
WaitSecs(2);

end
clear Screen
end

   


