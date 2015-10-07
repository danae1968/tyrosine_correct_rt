function rancolor3
crossLength=10;
crossColor=[200 0 200];
crossWidth=3;
 
crossLines=[-crossLength,0;crossLength,0; 0, -crossLength; 0, crossLength];
crossLines=crossLines';
xCenter=rect(3)/2;
yCenter=rect(4)/2;
 
% s=rng;
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


color1=randi(225,[3,3]);
color2=randi(225,[3,3]);

 
Screen('Flip',wPtr);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);

allRects=[rectOne',rectTwo',rectThree'];
Screen('FillRect',wPtr,color1,allRects);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);
% KbStrokeWait;
Screen('Flip',wPtr);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);

Screen('FillRect',wPtr,color2,allRects);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);

Screen('Flip',wPtr);
Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
Screen('Flip',wPtr);
WaitSecs(2);

