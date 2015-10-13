%Shuffle trials in 4 blocks

% trials=cell(1,4);
% for i=1:4
%     trials{i}=randi(3,[36,4])-1
%     
% end

%make it general
% in general script define trial number and blocks here:
% function with input (trial number and blocks), output: trialtypes

function [trialTypes,trialTypesS]=trialTypes(trialsNumber,blocks,types)

% trialsNumber=36;
% types=3;
% blocks=4;

Ignore=zeros(trialsNumber/types,blocks); 
No_Inter=ones(trialsNumber/types,blocks);
Update=ones(trialsNumber/types,blocks)+1;
trialTypes=[Ignore;No_Inter;Update]

%  trialTypesS= Shuffle(trialTypes)
end




