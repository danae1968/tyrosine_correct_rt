Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);

[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));

HideCursor;
rectOne=[500 500 600 600];
% color=hsvcolormap;
color=colormatrix;
time=GetSecs();
for i=1:length(color)
Screen('FillRect',wPtr,color(i,:),rectOne);
Screen('Flip',wPtr);
WaitSecs(1)
end
clear Screen