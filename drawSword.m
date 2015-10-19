% function drawSword(wPtr,rect,penThickness,swordColor,crossWidth)

Screen('Preference','SkipSyncTests',1); 
swordWidth=20;
swordHeight=200;
swordColor=[0 0 0];
penThickness=4;
xLocation=rect(3)/2;
yLocation=rect(4)/2;
inc=2;
leeway=1;
radius=40;
 crossLines=[-swordWidth,0;swordWidth,0; 0, -swordWidth; 0, swordHeight];
 crossLines=crossLines';
 
 [wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
 
 xCenter=rect(3)/2;
 yCenter=rect(4)/2;
 
 while ~buttons
 [mouseX,mouseY,buttons]=GetMouse(wPtr);
 if xLocation<mouseX-leeway
     xLocation=xLocation+inc;
     elseif xLocation>mouseX+leeway
     xLovation=xLocation-inc;
 end
 if yLocation<mouseX-leeway
     yLocation=yLocation+inc;
 elseif xLocation>mouseX+leeway
     yLocation=yLocation-inc;
 end
 
 if yLocation>rect(3)
     xLocation=rect(3);
 elseif xLocation<0
     xLocation=0;
 end
 
 if yLocation>rect(4)
     yLocation=rect(4);
 elseif yLocation<0
     yLocation=0;
 end
 
 Screen('DrawLines',wPtr,crossLines,penThickness,swordColor,[xCenter,yCenter]);
 ballRect=[xLocation-radius,yLocation-radius,xLocation+radius,yLocation+radius];
 Screen('FillOval',wPtr,[100 100 100],ballRect);
 Screen('Flip',wPtr);
 KbStrokeWait;
 clear Screen
 end
%  