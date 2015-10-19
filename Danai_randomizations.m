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

% colormatrix;  %calls function with color values
colormatrix=hsvcolormap;

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
%%5)
 %%add locations and colors to trial  
    for v=1:numBlocks
       for w=1:numTrials 
switch trial(w,v).setSize
    case 1
    trial(w,v).colors=datasample(colormatrix,2,'Replace',false);
    trial(w,v).locations=datasample(locationmatrix,1,'Replace',false);%chooses n rows from matrix without replacement
    case 2
    trial(w,v).colors=datasample(colormatrix,4,'Replace',false);
    trial(w,v).locations=datasample(locationmatrix,2,'Replace',false);
    case 3
    trial(w,v).colors=datasample(colormatrix,6,'Replace',false);
    trial(w,v).locations=datasample(locationmatrix,3,'Replace',false);
    case 4
    trial(w,v).colors=datasample(colormatrix,8,'Replace',false);
    trial(w,v).locations=locationmatrix;
end
       end
    end
    %% display encoding phase and 1st delay
   
% % function rancolor2
% 
% numTrials = 12; 
% numBlocks = 4;  
% numCondi = 3;
% 
% % trial=struct();
% % trials=Danai_randomizations  %calls function of trial data with number,type,color,location
% 
% Screen('Preference','SkipSyncTests',1); 
% Screen('Preference', 'SuppressAllWarnings', 1);
% [wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));  
%  HideCursor;
%  ListenChar(2);
%  Priority(1);
% 
% rectOne=[0 0 100 100]; %rect size 
% 
% for g=1:numTrials
%     for p=1:numBlocks
%         switch trial(g,p).setSize
%             case 1
%          rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));   
%             
%     drawFixationCross(wPtr,rect,10,[0 0 0],3)
%     Screen('Flip',wPtr);
%     WaitSecs(2);
%     
%     Screen('FillRect',wPtr,trial(g,p).colors,rectOne);
%     drawFixationCross(wPtr,rect,10,[0 0 0],3)
%     Screen('Flip',wPtr);
%     WaitSecs(2);
%             case 2
%                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
%                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
%                 
%                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                 Screen('Flip',wPtr);
%                 WaitSecs(2);
%     
%                 Screen('FillRect',wPtr,(trial(g,p).colors)',[rectOne',rectTwo']);
%                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                 Screen('Flip',wPtr);
%                 WaitSecs(2);
%                 
%                 case 3
%                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
%                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
%                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
%                
%                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                 Screen('Flip',wPtr);
%                 WaitSecs(2);
%     
%                 Screen('FillRect',wPtr,(trial(g,p).colors)',[rectOne',rectTwo',rectThree']);
%                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                 Screen('Flip',wPtr);
%                 WaitSecs(2);
%                 
%                 case 4
%                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
%                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
%                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
%                 rectFour=CenterRectOnPoint(rectOne,trial(g,p).locations(4,1),trial(g,p).locations(4,2));
%                
%                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                 Screen('Flip',wPtr);
%                 WaitSecs(2);
%     
%                 Screen('FillRect',wPtr,(trial(g,p).colors)',[rectOne',rectTwo',rectThree',rectFour']);
%                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                 Screen('Flip',wPtr);
%                 WaitSecs(2);
%                 
%         end
% 
%             
%     end
%     
% end
%%
%  clear Screen

 %%6)
%  function [onset RT resp acc] = showTrial(setsize, color, location, exptOnset,param)
 Screen('Preference','SkipSyncTests',1); 
Screen('Preference', 'SuppressAllWarnings', 1);
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));  
HideCursor;
ListenChar(2);
Priority(1);
Screen('TextSize',wPtr,16);
Screen('TextStyle',wPtr,1);
Screen('TextFont',wPtr,'Courier New');

%clear window

% SQUARES = [give setsize colors and locations]; make squares
% Screen('DrawTexture)
%Draw formatted text (

%lvlCue = Screen(param.wid, 'MakeTexture', param.image);    % display level cue
% Screen('DrawTexture', param.wid, lvlCue);
% main message
%  DrawFormattedText(wPtr,Squares,'center','center',param.stimCol);

% display
stimOnset = Screen(wPtr,'Flip');
% onset = stimOnset-exptOnset;
target='U';
non_target='N';
T_color=[0 255 100];
N_color=[225 0 40];
evt = [];
responded = [];
rectOne=[0 0 100 100];
%Seans part!!     
  for g=1:numTrials
      for p=1:numBlocks
        for phase = 1:5
          
       if phase == 1
            switch trial(g,p).trialType
                  case {0 1 2}
                         phaselabel='encoding';
                         switch trial(g,p).setSize
                             case 1
                                rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2)); 
                                color=trial(g,p).colors(1,:);
                                allrects=rectOne;
                             case 2
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 allrects=[rectOne',rectTwo'];
                                 color=(trial(g,p).colors((1:2),:))';
                             case 3
                                 
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                                 allrects=[rectOne',rectTwo',rectThree'];
                                 color=(trial(g,p).colors((1:3),:))';
                                 
                             case 4
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                                 rectFour=CenterRectOnPoint(rectOne,trial(g,p).locations(4,1),trial(g,p).locations(4,2));
                                 allrects=[rectOne',rectTwo',rectThree',rectFour'];
                                 color=(trial(g,p).colors((1:4),:))';
                         end
                         
                           Screen('FillRect',wPtr,color,allrects);
                           drawFixationCross(wPtr,rect,10,[0 0 0],3)
                           Screen('Flip',wPtr);
                           WaitSecs(2);
                           
                                  
%                          T.encoding_on(trial(g,p).number,numBlocks) = GetSecs; 
%                          WaitSecs(2.0);
%                          Screen('Flip',wPtr);  
%                          T.encoding_off(trial(g.p).number,numBlocks) = GetSecs;
 
            end
                         
       elseif phase == 2                                                                                                %first delay period
%             T.delay1_on(trial,run) = GetSecs;
            phaselabel ='delay 1';
            drawFixationCross(wPtr,rect,10,[0 0 0],3)
            Screen('Flip',wPtr);
            WaitSecs(2);
%             WaitSecs(pms.delay1Duration);
%             T.delay1_off(trial,run) = GetSecs;
                
       elseif phase == 3
            ignore = 'N';
            update = 'U';
                            
            Screen('Textsize', wPtr, 34);
            Screen('Textfont', wPtr, ['Times New Roman']); 
                            
            switch trial(g,p).trialType
                            
                           
                   case 1 % no interference fixation cross
                        phaselabel = 'no_interference';
                        drawFixationCross(wPtr,rect,10,[0 0 0],3)
%                         DrawFormattedText(wPtr, fixgross, 'center', 'center');   
                        Screen('Flip', wPtr)
                        WaitSecs(2);
                                
% %                         T.i2_null_on(trial,whatcondition,whatsession) = GetSecs;
%                         WaitSecs(inter_time);
%                         Screen('Flip',w);
%                         T.i2_null_off(trial,whatcondition,whatsession) = GetSecs;
                                   
                   case 0 %ignore
                        phaselabel = 'new_info_ignore_total';
%                         Screen('BlendFunction', w, GL_SRC_ALPHA, ...
%                                                 GL_ONE_MINUS_SRC_ALPHA);
                        
                        switch trial(g,p).setSize
                             case 1
                                rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2)); 
                                color=trial(g,p).colors(2,:);
                                allrects=rectOne;
                             case 2
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 allrects=[rectOne',rectTwo'];
                                 color=(trial(g,p).colors((3:4),:))';
                             case 3
                                 
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                                 allrects=[rectOne',rectTwo',rectThree'];
                                 color=(trial(g,p).colors((4:6),:))';
                                 
                             case 4
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                                 rectFour=CenterRectOnPoint(rectOne,trial(g,p).locations(4,1),trial(g,p).locations(4,2));
                                 allrects=[rectOne',rectTwo',rectThree',rectFour'];
                                 color=(trial(g,p).colors((5:8),:))';
                         end
                         
                           Screen('FillRect',wPtr,color,allrects);
                           DrawFormattedText(wPtr, non_target, 'center', 'center', N_color);
%                            drawFixationCross(wPtr,rect,10,[0 0 0],3)
                           Screen('Flip',wPtr);
                           WaitSecs(2);
          
%                         [VBLTimestamp startrt]=Screen('Flip', w);

%                         T.i2_ignore_on(trial,whatcondition,whatsession) = GetSecs;
%                         WaitSecs(inter_time);
%                         Screen('Flip',w);
%                         T.i2_ignore_off(trial,whatcondition,whatsession) = GetSecs;

                    case 2
                        phaselabel = 'new_info_update';
%                         Screen('BlendFunction', w, GL_SRC_ALPHA, ...
%                                             GL_ONE_MINUS_SRC_ALPHA);
                    
                        switch trial(g,p).setSize
                             case 1
                                rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2)); 
                                color=trial(g,p).colors(2,:);
                                allrects=rectOne;
                             case 2
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 allrects=[rectOne',rectTwo'];
                                 color=(trial(g,p).colors((3:4),:))';
                             case 3
                                 
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                                 allrects=[rectOne',rectTwo',rectThree'];
                                 color=(trial(g,p).colors((4:6),:))';
                                 
                             case 4
                                 rectOne=CenterRectOnPoint(rectOne,trial(g,p).locations(1,1),trial(g,p).locations(1,2));
                                 rectTwo=CenterRectOnPoint(rectOne,trial(g,p).locations(2,1),trial(g,p).locations(2,2));
                                 rectThree=CenterRectOnPoint(rectOne,trial(g,p).locations(3,1),trial(g,p).locations(3,2));
                                 rectFour=CenterRectOnPoint(rectOne,trial(g,p).locations(4,1),trial(g,p).locations(4,2));
                                 allrects=[rectOne',rectTwo',rectThree',rectFour'];
                                 color=(trial(g,p).colors((5:8),:))';
                         end
                         
                           Screen('FillRect',wPtr,color,allrects);
                           DrawFormattedText(wPtr, target, 'center', 'center', T_color);
%                            drawFixationCross(wPtr,rect,10,[0 0 0],3)
                           Screen('Flip',wPtr);
                           WaitSecs(2);
 
% 
%                         [VBLTimestamp startrt]=Screen('Flip', w);

%                         T.i2_update_on(trial,whatcondition,whatsession) = GetSecs;
%                         WaitSecs(inter_time);
%                         Screen('Flip',w);
%                         T.i2_update_off(trial,whatcondition,whatsession) = GetSecs; 
%                         Screen('Flip',w);
%                         T.i2_update_off(trial,whatcondition,whatsession) = GetSecs;
                         
            end % TYPETRIAL
          
      elseif phase == 4
                 phaselabel = 'delay 2';
%                  T.delay2_on(trial,whatcondition,whatsession) = GetSecs; 
                 drawFixationCross(wPtr,rect,10,[0 0 0],3)
                 Screen('Flip',wPtr);
%                  WaitSecs(J.delay2(trial,whatcondition));
%                  T.delay2_off(trial,whatcondition,whatsession) = GetSecs; 
                 WaitSecs(2)

                      elseif phase == 5  %old version
                          phaselabel = 'probe';
                          switch trial(g,p).setSize
                              case 1
                                  probeRectX=trial(g,p).locations(1);
                                  probeRectY=trial(g,p).locations(2);
                              otherwise
                                  locationsrect=trial(g,p).locations;
                                  probeRectXY=datasample(locationsrect,1);
                                  probeRectX=probeRectXY(1,1);
                                  probeRectY=probeRectXY(1,2);
                          end
                          ShowCursor;
                          probeColor=[0 0 0];
                          probeRect=[100 100 200 200];
                          insideRect=[rect(1) rect(2) 0.67*rect(4) 0.67*rect(4)];
                          outsideRect=[rect(1) rect(2) 0.9*rect(4) 0.9*rect(4)];
                          outsideRect=CenterRectOnPoint(outsideRect,rect(3)/2, rect(4)/2);
                          insideRect=CenterRectOnPoint(insideRect,rect(3)/2,rect(4)/2);
                          probeRect=CenterRectOnPoint(probeRect,probeRectX,probeRectY);
                          % colors=colormatrix;
                          colors=hsvcolormap;
                          colorangle=360/length(colors);  %convert into pi? 
                          rads=0:colorangle:360;
                          for ind=1:length(colors)
                              Screen('FillArc',wPtr,colors(ind,:),outsideRect,rads(ind),colorangle);
                          end
                          
                          Screen('FillOval',wPtr,[255 255 255 ],insideRect);
                          Screen('FrameRect', wPtr, probeColor, probeRect);
                          Screen('Flip',wPtr)
                          [clicks,x,y,whichButton] = GetClicks(wPtr)
%                           KeyCode(oldresp) = 0;
%                           KeyCode(newresp) = 0;
%                           ezpass = -1; 
%                           start_time = GetSecs;     
%                           probe_time = GetSecs;
%                           T.rtimekeeper(trial,whatcondition,whatsession) = probe_time-time0;
%                           if probe_time - time0 > rtime, break, end
%                           [KeyIsDown, secs, KeyCode] = KbCheck(-1);  
                          WaitSecs(0.001);

       end
        end
      end
  end
      clear Screen
  end
       
                
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
