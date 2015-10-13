
trialsNumber=[1:12];
types=3;
blocks=1;

sets=[1:4]';
setsize=repmat(sets,[length(trialsNumber)/length(sets),blocks])


Ignore=zeros(length(trialsNumber)/types,blocks); 
No_Inter=ones(length(trialsNumber)/types,blocks);
Update=ones(length(trialsNumber)/types,blocks)+1;
trialTypes=[Ignore;No_Inter;Update]

trials=struct();

index=randperm(12)'

for i=1:length(trialsNumber)
    trials(i).number=trialsNumber(i)
end

for j=1:length(trialsNumber)
    trials(j).type=trialTypes(index)
    trials(j).setsize=setsize(index)
end
