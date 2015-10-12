Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);

[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));

color = [0 0 200];

rectOne=[0 0 100 100];
rectTwo=[0 0 100 100];
rectThree=[0 0 100 100];         %rect size
rectFour=[0 0 100 100];

rectOneX=0.4*(rect(3));   %rect locations
rectOneY=0.35*(rect(4));

rectTwoX=0.6*(rect(3));
rectTwoY=0.4*(rect(4));

rectThreeX=0.55*(rect(3));
rectThreeY=0.7*(rect(4));

rectFourX=0.4*(rect(3));
rectFourY=5*(rect(4))/8;

rectOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);  %places rects on location we want
rectTwo=CenterRectOnPoint(rectTwo,rectTwoX,rectTwoY);
rectThree=CenterRectOnPoint(rectThree,rectThreeX,rectThreeY);
rectFour=CenterRectOnPoint(rectFour,rectFourX,rectFourY);

allRects=[rectOne',rectTwo',rectThree',rectFour'];

Screen('FillRect',wPtr,color,[rectOne',rectThree']);
drawFixationCross(wPtr,rect,10,[0 0 0],3)
Screen('Flip',wPtr);
KbStrokeWait
clear Screen