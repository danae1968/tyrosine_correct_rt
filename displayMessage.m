function [resp, rt]=displayMessage(msg,submsg,keyresp)
Screen('Preference','SkipSyncTests',1);     %skip these if we call the function later
Screen('Preference', 'SuppressAllWarnings', 1);
HideCursor;

% devices = PsychHID('Devices');


msg='Hello World';         %skip if called in script
submsg='I m your wild girl';
keyresp='any';

% %if I need to read text from file: 
% myFile=fopen('message.txt','r');
% msg=fgetl(myFile);
% fclose(myFile);

ListenChar(); %activates listening to responses
[wPtr,rect]=Screen('Openwindow',max(Screen('Screens')));
onset=GetSecs();
Response = GetChar(); %records responses
Screen('FillRect',wPtr)

% xCenter=rect(3)/2;              not needed if we use DrawFormattedText
% yCenter=rect(4)/2;
Screen('TextSize',wPtr,24);
Screen('TextFont',wPtr,'Times New Roman');
Screen('TextStyle',wPtr,1); %1=bold
wrapAt=50;  %at how many characters to wrap text to next line
textcolor=[200 0 0];
[~,ny]=DrawFormattedText(wPtr,msg,'center','center',textcolor, wrapAt);

if ~isempty(submsg)
    Screen('TextSize',wPtr,19);
    DrawFormattedText(wPtr,submsg,'center',ny +50,textcolor, wrapAt);
end
Screen('Flip',wPtr);
WaitSecs(1);

responded=0;
while responded==0;
    if ~isempty(keyresp)
        [KeyIsDown,secs,KeyCode]=KbCheck;
        if KeyIsDown==1
            responseMatches=any(ismember(KbName(KeyCode),keyresp));
            if strcmp(keyresp, 'any')||responseMatches
                responded=1;
                resp=KbName(KeyCode);
                rt=secs-onset;
            end
        end
    end
    WaitSecs(0.01);
end
Screen('FillRect',wPtr);   
Screen('Flip',wPtr);
clear Screen       %skip if called in another script

                
        
