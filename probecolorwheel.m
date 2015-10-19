function probecolorwheel
Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));   

myRectThree=[500 500 600 600]
myRectTwo=[100 100 670 670]
myRect=[100 100 850 850]
myRect=CenterRectOnPoint(myRect,rect(3)/2, rect(4)/2);
myRectTwo=CenterRectOnPoint(myRectTwo,rect(3)/2,rect(4)/2);

% colors=colormatrix;
colors=hsvcolormap;
colorangle=360/length(colors);  %convert into pi? 
rads=0:colorangle:360;

for i=1:length(colors)
Screen('FillArc',wPtr,colors(i,:),myRect,rads(i),colorangle);
end
 Screen('FillOval',wPtr,[255 255 255 ],[myRectTwo]);
Screen('FrameRect', wPtr, [0 0 0], myRectThree);
Screen('Flip',wPtr)
[clicks,x,y,whichButton] = GetClicks(wPtr)
% KbStrokeWait();
% for  j=1:clicks
%  clut=Screen('GetClut',wPtr,8)
clear Screen
