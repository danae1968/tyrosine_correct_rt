

Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);


[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
wheelphoto = imread('StandardRing.jpg');
size(wheelphoto);
faceTexture = Screen('MakeTexture',wPtr,wheelphoto);
Screen('DrawTexture',wPtr,faceTexture);
Screen('Flip',wPtr);
% [clicks,x,y,whichButton] = GetClicks(wPtr)
WaitSecs(3);
clear Screen
% pixels=impixel(wheelphoto)
[c,r,P] = impixel(wheelphoto)
