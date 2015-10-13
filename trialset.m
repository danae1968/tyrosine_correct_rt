%relate trial type and difficulty

trialsNumber=12;
types=3;
blocks=1;

trialTypes=trialTypes(trialsNumber,blocks,types)

sets=[1:4]';
setsize=repmat(sets,[trialsNumber/length(sets),blocks])


trials=struct();

index=randperm(12)';

for i=1:trialsNumber
trials(i).number=trialsNumber(i)
% trials(i).type=trialTypes(i)
% trials(i).setsize=setsize(i)
    end


% set=randperm(4);
% 
% for i=1:12
% if trials(i).type==0
%     trials(i).setsize=datasample(set,1)
% end
% 
%     if trials(i).type==1
%         trials(i).setsize=datasample(set,1)
%     end
%     
%         if trials(i).type==2
%         trials(i).setsize=datasample(set,1)
%         end
%     
% end
% 
% 
% 
% 
% 
