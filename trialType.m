%Shuffle trials in 4 blocks- I think I made too many trials

% trials=cell(1,4);
% for i=1:4
%     trials{i}=randi(3,[36,4])-1
%     
% end

Ignore=zeros(4,4);
No_Inter=ones(4,4);
Update=No_Inter+1;
runs=[Ignore;No_Inter;Update];

blocks=cell(1,4);
for i=1:4
    blocks{i}=Shuffle(runs)
end


