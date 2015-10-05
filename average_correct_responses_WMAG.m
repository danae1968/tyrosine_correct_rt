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
%     load filename(i);
% end
cd('M:\.matlab\GitHub\tyrosine_tutorials\WMAG_data');
names=dir('M:\.matlab\GitHub\tyrosine_tutorials\WMAG_data')
names=names(3:length(names)); %removes some data to fix length
analysis=(struct);

for j = 1:length(names)
temp = load(names(j).name);

%analysis.avg_participant(i)=


mean_correct_total=sum(temp.correct(:))/(size(temp.correct,1)*size(temp.correct,2));
mean_correct_percentage=(mean_correct_total)*100;

mean_rt_total=sum(temp.rt(:))/(size(temp.rt,1)*size(temp.rt,2));
mean_rt_percentage=(mean_rt_total)*100;

ignore=[];
no_inter=[];
update=[];

for i=1:size(temp.trialmem,1)*size(temp.trialmem,2);
    %alternatively switch a(i) case
    if temp.trialmem(i)==0;
        ignore=[ignore,i];
    elseif temp.trialmem(i)==1
        no_inter=[no_inter,i];
    elseif temp.trialmem(i)==2;
        update=[update,i];
    end
end

mean_correct_ignore=sum(temp.correct(ignore))/length(ignore);
mean_correct_no_inter=sum(temp.correct(no_inter))/length(no_inter);
mean_correct_update=sum(temp.correct(update))/length(update);

mean_rt_ignore=sum(temp.rt(ignore))/length(ignore);
mean_rt_no_inter=sum(temp.rt(no_inter))/length(no_inter);
mean_rt_update=sum(temp.rt(update))/length(update);
%can I add subs instead of subNo?
fprintf('Subject %d answered correctly overall on %.2f %% of cases and their mean RT was %.4f.  Their mean score for ignore trials was %.2f and RT %.4f, no interference %.2f and RT %.4f and update %.2f and RT %.4f\n', temp.subNo,  mean_correct_percentage, mean_rt_total, mean_correct_ignore, mean_rt_ignore, mean_correct_no_inter, mean_rt_no_inter, mean_correct_update, mean_rt_update)

data_correct=[mean_correct_total mean_correct_ignore mean_correct_no_inter mean_correct_update];
%  figure;
%  bar(data_correct)
%  set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
%   ylabel('Percentage correct');
%   title('Day 2, subject 2, Responses');
  
data_rt=[mean_rt_total mean_rt_ignore mean_rt_no_inter mean_rt_update];
%  figure;
%  bar(data_rt)
%  set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
%   ylabel('RT');
%   title('Day 2, subject 2, Reaction Times');

analysis(j).mean_correct_total=mean_correct_total;
analysis(j).mean_correct_ignore = mean_correct_ignore;
analysis(j).mean_correct_no_inter = mean_correct_no_inter;
analysis(j).mean_correct_update=mean_correct_update;

analysis(j).mean_rt_total=mean_rt_total;
analysis(j).mean_rt_ignore = mean_rt_no_inter;
analysis(j).mean_rt_no_inter = mean_rt_no_inter;
analysis(j).mean_rt_update=mean_rt_update;


    average_correct=(sum([analysis(:).mean_correct_total]))/length(names);
    average_correct_ignore=(sum([analysis(:).mean_correct_ignore]))/length(names);
    average_correct_no_inter=(sum([analysis(:).mean_correct_no_inter]))/length(names);
    average_correct_update=(sum([analysis(:).mean_correct_update]))/length(names);
    st_dev_correct_
  
    average_rt=(sum([analysis(:).mean_rt_total]))/length(names);
    average_rt_ignore=(sum([analysis(:).mean_rt_ignore]))/length(names);
    average_rt_no_inter=(sum([analysis(:).mean_rt_no_inter]))/length(names);
    average_rt_update=(sum([analysis(:).mean_rt_update]))/length(names);

    data_average_correct=[average_correct average_correct_ignore average_correct_no_inter average_correct_update];
    data_average_rt=[average_rt average_rt_ignore average_rt_no_inter average_rt_update];

    figure;
    bar(data_average_correct)
    set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
    ylabel('Percentage correct');
    title('Average correct responses for four participants');
    
    figure;
    bar(data_average_rt)
    set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
    ylabel('RT');
    title('Average RT for four Participants');
end