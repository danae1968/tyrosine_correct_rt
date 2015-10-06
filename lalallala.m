function average_correct_responses_WMAG

%attempt1
% struct2cell(names)
% 
% subjects_number=[40];
% number_sessions=[2];
% subs=(1:subjects_number);
% n=length(subs);
% sessions=(1:number_sessions);
% ns=length(number_sessions);
% fmriMode=1;
% 
% for i=1:n
%     for j=1:ns
%         if fmriMode==0
%             if exist(i)
%                 if exist(j)
%             
%             filename=sprintf('WMAG_data_s%d_session_%d.mat',subs(i),number_sessions(j));
%         elseif fmriMode==1
%             filename=sprintf('WMAG_FMRI_data_s%d_session_%d.mat',subs(i),number_sessions(j));
%         end
%             end
%         end
%     end
%     
% load filename
% end
% 
%
%attempt2
% for i=1:length(names(1,:));
%     filename(i)=names(1,i);
%     load filename(:);
% end
clear all;
cd('M:\.matlab\GitHub\tyrosine_tutorials\WMAG_data');
names=dir('M:\.matlab\GitHub\tyrosine_tutorials\WMAG_data');
% names=ls('*.mat');
names=names(3:length(names)); %removes some data to fix length
sub=(struct);

correct_all_subs=[];
rt_all_subs=[];
ignore=[];
no_inter=[];
update=[];

for j = 1:length(names)
temp = load(names(j).name);

sub(j).correct=temp.correct   %struct of variables i want to use
sub(j).rt=temp.rt
sub(j).trialmem=temp.trialmem 

correct_all_subs=[correct_all_subs;sub(j).correct]

rt_all_subs=[rt_all_subs;sub(j).rt]

for i=1:size(sub(j).trialmem,1)*size(sub(j).trialmem,2);
    %alternatively switch a(i) case
    if sub(j).trialmem(i)==0;
        ignore=[ignore,i]
    elseif sub(j).trialmem(i)==1
        no_inter=[no_inter,i];
    elseif sub(j).trialmem(i)==2;
        update=[update,i];
    end
end

end
average_correct_all_subs=mean2(correct_all_subs); %mean of all elements in matrix
average_correct_ignore_all_subs=mean2(correct_all_subs(ignore))
average_correct_no_inter_all_subs=mean2(correct_all_subs(no_inter));
average_correct_update_all_subs=mean2(correct_all_subs(update));

st_dev_correct_all_subs=std2(correct_all_subs);
st_dev_correct_ignore=std2(correct_all_subs(ignore));
st_dev_correct_no_inter=std2(correct_all_subs(no_inter));
st_dev_correct_update=std2(correct_all_subs(update));


average_rt_all_subs=mean2(rt_all_subs) %mean of all elements in matrix
average_rt_ignore_all_subs=mean2(rt_all_subs(ignore))
average_rt_no_inter_all_subs=mean2(rt_all_subs(no_inter))
average_rt_update_all_subs=mean2(rt_all_subs(update))

st_dev_rt_all_subs=std2(rt_all_subs);
st_dev_rt_ignore=std2(rt_all_subs(ignore));
st_dev_rt_no_inter=std2(rt_all_subs(no_inter));
st_dev_rt_update=std2(rt_all_subs(update));

data_st_dev_correct=[st_dev_correct_all_subs st_dev_correct_ignore st_dev_correct_no_inter st_dev_correct_update];
data_st_dev_rt=[st_dev_rt_all_subs st_dev_rt_ignore st_dev_rt_no_inter st_dev_rt_update];
data_average_rt=[average_rt_all_subs average_rt_ignore_all_subs average_rt_no_inter_all_subs average_rt_update_all_subs];
data_average_correct=[average_correct_all_subs average_correct_ignore_all_subs average_correct_no_inter_all_subs average_correct_update_all_subs];


figure()
bar(data_average_correct)
set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
ylabel('Percentage correct');
title('Average correct responses of all subjects');
hold on
errorbar(data_average_correct,data_st_dev_correct)
hold off


figure()

bar(data_average_rt)
set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
ylabel('RT');
title('Average RTs of all subjects');
hold on
errorbar(data_average_rt,data_st_dev_rt)
hold off
