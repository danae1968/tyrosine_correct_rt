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
rectTwoY=0.37*(rect(4));

rectThreeX=0.6*(rect(3));
rectThreeY=0.6*(rect(4));

rectFourX=0.41*(rect(3));
rectFourY=0.6*(rect(4));

locationOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);  %places rects on location we want
locationTwo=CenterRectOnPoint(rectOne,rectTwoX,rectTwoY);
locationThree=CenterRectOnPoint(rectOne,rectThreeX,rectThreeY);
locationFour=CenterRectOnPoint(rectOne,rectFourX,rectFourY);

locationmatrix=[locationOne',locationTwo',locationThree',locationFour'];

Screen('FillRect',wPtr,color,[locationmatrix]);
drawFixationCross(wPtr,rect,10,[0 0 0],3)
Screen('Flip',wPtr);
KbStrokeWait
clear Screen

ovalA=[100,100,200,200]
drawFixationCross(wPtr,rect,10,[0 0 0],3)
Screen('FrameOval',wPtr,[250 0 0],ovalA)
Screen('Flip',wPtr);
KbStrokeWait
clear Screen




