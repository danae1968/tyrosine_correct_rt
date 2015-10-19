
Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));   

probeColor=[0 0 0];
myRectThree=[500 500 600 600];
insideRect=[rect(1) rect(2) 0.67*rect(4) 0.67*rect(4)];
outsideRect=[rect(1) rect(2) 0.9*rect(4) 0.9*rect(4)];
outsideRect=CenterRectOnPoint(outsideRect,rect(3)/2, rect(4)/2);
insideRect=CenterRectOnPoint(insideRect,rect(3)/2,rect(4)/2);

colors=colormatrix;
% colors=hsvcolormap;
colorangle=360/length(colors);  %convert into pi? 
rads=0:colorangle:360;

for i=1:length(colors)
Screen('FillArc',wPtr,colors(i,:),outsideRect,rads(i),colorangle);
end
 Screen('FillOval',wPtr,[255 255 255 ],insideRect);
Screen('FrameRect', wPtr, probeColor, myRectThree);
Screen('Flip',wPtr)
[clicks,x,y,whichButton] = GetClicks(wPtr)
% KbStrokeWait();
% for  j=1:clicks
%  clut=Screen('GetClut',wPtr,8)
clear Screen
