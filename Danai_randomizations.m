function[trial]=Danai_randomizations


numTrials = 12; % adaptable; important to be dividable by 3 (conditions) and multiple of 12 :)
numBlocks = 4;  
numCondi = 3;  % 0 IGNORE, 1 NOINT, 2 UPDATE

trialvector = [zeros(1,(numTrials/numCondi)), ones(1,numTrials/numCondi), 2*ones(1,numTrials/numCondi)]';
blockmatrix = repmat(trialvector, 1,numBlocks);

setsize = [1,2,3,4]';
setsizevector = repmat(setsize,numCondi,numBlocks);

%% 1) Get randomization idx output
RandomIdx=[];       %Get randomization idx output
for v = 1:numBlocks
    RandomIdx(:,v)= randperm(numTrials);
end

%% 2) Apply same RandomIdx to eg Blockmatrix, (but also setsize,...)

typematrixRand =[numTrials,numBlocks];
setsizevectorRand =[numTrials,numBlocks];

for y = 1:numBlocks
    for x = 1:numTrials
 typematrixRand(x,y) = blockmatrix(RandomIdx(x,y));
 setsizevectorRand(x,y) = setsizevector(RandomIdx(x,y));
    end
end

%%3)make location matrix

% [wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));  %typed that
% % %to get rect values
% clear Screen
 rectsize=[0 0 100 100];
 rect =[0 0 1680 1050]; %why does this not work? fix this
 numrects=4;
 xyindex=[0.4 0.6 0.6 0.41;0.35 0.37 0.6 0.6]';
 
locationmatrix=zeros(size(xyindex,1),size(xyindex,2));
 for r=1:length(locationmatrix)
locationmatrix(r,1)=(rect(3)*xyindex(r,1));
locationmatrix(r,2)=(rect(4)*xyindex(r,2));
 end

 %%color matrix
 
% colormatrix1
colormatrix;  %calls function with color values

%%%  Put into structure (for easy output of function)
trialsvector=(1:numTrials)';
trialsmatrix=repmat(trialsvector,1,numBlocks);

trial=struct();
for i=1:numBlocks
    for t=1:numTrials
trial(t,i).number=trialsmatrix(t,i);
trial(t,i).trialType = typematrixRand(t,i);
trial(t,i).setSize=setsizevectorRand(t,i);
    end
end
%%
 %%add locations and colors to trial  
    for v=1:numBlocks
       for w=1:numTrials 
switch trial(w,v).setSize
    case 1
    trial(w,v).colors=datasample(colormatrix,1,'Replace',false);
    trial(w,v).locations=datasample(locationmatrix,1,'Replace',false);%chooses n rows from matrix without replacement
    case 2
    trial(w,v).colors=datasample(colormatrix,2,'Replace',false);
    trial(w,v).locations=datasample(locationmatrix,2,'Replace',false);
    case 3
    trial(w,v).colors=datasample(colormatrix,3,'Replace',false);
    trial(w,v).locations=datasample(locationmatrix,3,'Replace',false);
    case 4
    trial(w,v).colors=datasample(colormatrix,4,'Replace',false);
    trial(w,v).locations=locationmatrix;
end
       end
    end
   
% function rancolor2

numTrials = 12; 
numBlocks = 4;  
numCondi = 3;

% trial=struct();
% trials=Danai_randomizations  %calls function of trial data with number,type,color,location

Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));  
 HideCursor;
 ListenChar(2);
 Priority(1);

rectOne=[0 0 100 100]; %rect size 

for g=1:numTrials
    for p=1:numBlocks
        switch trial(g,p).setSize
            case 1
         rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));   
            
    drawFixationCross(wPtr,rect,10,[0 0 0],3)
    Screen('Flip',wPtr);
    WaitSecs(2);
    
    Screen('FillRect',wPtr,trial(g,p).colors,rectOne);
    drawFixationCross(wPtr,rect,10,[0 0 0],3)
    Screen('Flip',wPtr);
    WaitSecs(2);
            case 2
                rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                
                drawFixationCross(wPtr,rect,10,[0 0 0],3)
                Screen('Flip',wPtr);
                WaitSecs(2);
    
                Screen('FillRect',wPtr,(trial(g,p).colors)',[rectOne',rectTwo']);
                drawFixationCross(wPtr,rect,10,[0 0 0],3)
                Screen('Flip',wPtr);
                WaitSecs(2);
                
                case 3
                rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
               
                drawFixationCross(wPtr,rect,10,[0 0 0],3)
                Screen('Flip',wPtr);
                WaitSecs(2);
    
                Screen('FillRect',wPtr,(trial(g,p).colors)',[rectOne',rectTwo',rectThree']);
                drawFixationCross(wPtr,rect,10,[0 0 0],3)
                Screen('Flip',wPtr);
                WaitSecs(2);
                
                case 4
                rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                rectFour=CenterRectOnPoint(rectOne,trial(g,p).locations(4,1),trial(g,p).locations(4,2));
               
                drawFixationCross(wPtr,rect,10,[0 0 0],3)
                Screen('Flip',wPtr);
                WaitSecs(2);
    
                Screen('FillRect',wPtr,(trial(g,p).colors)',[rectOne',rectTwo',rectThree',rectFour']);
                drawFixationCross(wPtr,rect,10,[0 0 0],3)
                Screen('Flip',wPtr);
                WaitSecs(2);
                
        end

            
    end
    
end
 clear Screen


% %General aims:
% %AIM 1: get blockvector randomized 
% %AIM 2: make setsize matrix of same size (numTrials * numBlocks) including numbers 1-4 on each trialtype
% %AIM 3: make location matrix 
% %AIM 4: make color matrix
% %AIM 5: present the trials on screen as if only encoding; with button press continue, or wait 2 sec
% %AIM 6: then: phase 2: after encoding (eg 2 sec) and delay1 (eg 2 sec), intervening stimulus appears:  same set size as encoding, ...
%         %same location (?), but color different. If trialtype 0: present N in center; if trialtyp 1: +, trialtype 2: U
% %AIM 7: make probe; CHALLENGE!
%         
% end
% 
