function rancolor2
Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));   

numTrials = 12; 
numBlocks = 4;  
numCondi = 3;

trial=struct();
trials=Danai_randomizations  %calls function of trial data with number,type,color,location

 HideCursor;
 ListenChar(2);
 Priority(1);

rectOne=[0 0 100 100]; %rect size 


% rectOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);  %places rects on location we want
% rectTwo=CenterRectOnPoint(rectOne,rectTwoX,rectTwoY);
% rectThree=CenterRectOnPoint(rectOne,rectThreeX,rectThreeY);
% rectFour=CenterRectOnPoint(rectOne,rectFourX,rectFourY);


for i=1:numTrials
    for j=1:numBlocks
        if trial(i,j).setSize==1
            rectOne=CenterRectOnPoint(rectOne,trial(i,j).locations(:,1),trial(i,j).locations(:,2));
            
     
    drawFixationCross(wPtr,rect,10,[0 0 0],3)
    Screen('Flip',wPtr);
    WaitSecs(2);
    
    Screen('FillRect',wPtr,trial(i,j).colors,rectOne);
    drawFixationCross(wPtr,rect,10,[0 0 0],3)
    Screen('Flip',wPtr);
    WaitSecs(2);
        end
    end
end
 
% Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA); 


% allRects=[rectOne',rectTwo',rectThree',rectFour'];

% Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
% drawFixationCross(wPtr,rect,10,[0 0 0],3)
% Screen('Flip',wPtr);
% WaitSecs(2);
% KbStrokeWait;

% Screen('Flip',wPtr);
% Screen('DrawLines',wPtr,crossLines,crossWidth,crossColor,[xCenter,yCenter]);
% Screen('Flip',wPtr);
% drawFixationCross(wPtr,rect,10,[0 0 0],3)
% WaitSecs(2);
clear Screen
end


   


