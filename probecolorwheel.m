function probecolorwheel
Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));   

myRectThree=[500 400 600 500];
myRectTwo=[100 100 600 600];
myRect=[100 100 800 800];
myRect=CenterRectOnPoint(myRect,rect(3)/2, rect(4)/2);
myRectTwo=CenterRectOnPoint(myRectTwo,rect(3)/2,rect(4)/2);

% Screen('FillRect',wPtr,[255 255 255],myRect);
% Screen('FillOval',wPtr,[255 10 100 ],[myRect]);
% Screen('FillRect',wPtr,[255 10 100],myRectTwo);
% Screen('FillOval',wPtr,[255 255 255 ],[myRectTwo]);
% Screen('Flip',wPtr);
% KbStrokeWait();

% Screen('DrawArc',wPtr,[127],[200 200 400 400],23,200)
% Screen('Flip',wPtr)
% KbStrokeWait();
% colors=colormatrix;
colors=hsvcolormap;
colorangle=360/length(colors);  %convert into pi
rads=0:colorangle:360

for i=1:length(colors)
Screen('FillArc',wPtr,colors(i,:),myRect,rads(i),colorangle);
end
Screen('FillOval',wPtr,[255 255 255 ],[myRectTwo]);
Screen('FrameRect', wPtr, [0 0 0], myRectThree);
Screen('Flip',wPtr)
KbStrokeWait();
clear Screen