% social buffering
% aversive neutral: 27 trials in each condition
% %%%%%%%%%  Markers for ERPs  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anticipation aversive cue 11, neutral cue 21.
% post sound  aversive sound 13 31, neutral sound 23 41
% subjects in alone condition: 1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74
% subjects in social condition: 19 20 22 24 25 27 28 29 30 31 34 36 39 41 66 75 76 43 45 46 47 48 50 51 52 54 55 57 58 60 61 62 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
%% define the routin of the folder
base_dir=strcat('D:\study\In Germany\study\the data\EADanalysis\raw data')
cd (base_dir)
% start EEGLAB under Matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 
alone=[1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74]; % subject number
social=[19 20 22 24 25 27 28 29 30 31 34 36 39 41 66 75 76 43 45 46 47 48 50 51 52 54 55 57 58 60 61 62];
%% plot for first half
% cue: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivecue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_aversivecue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% cue: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralcue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_neutralcue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: socialaversive
for i=1:length(social)
    setname= [num2str(social(i)),'_aversivecue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_aversivecue_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: socialneutral
for i=1:length(social)
    setname= [num2str(social(i)),'_neutralcue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_neutralcue_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:7000],'Ytick',[-0.2:0.1:0.3],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 7000 -0.2 0.3]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(first_aversivecue_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(first_neutralcue_alone(:,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(first_aversivecue_social(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g solid green 'LineType','-',
plot(EEG.times, squeeze(mean(first_neutralcue_social(:,1,:),1)),'-.','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g dashdot green 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Arial'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('cue in the first half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\study\the data\EADanalysis\raw data\cue_firsthalf.pdf'); % save current figure

% sound: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivesound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_aversivesound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% sound: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralsound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_neutralsound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: socialaversive
for i=1:length(social)
    setname= [num2str(social(i)),'_aversivesound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_aversivesound_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: socialneutral
for i=1:length(social)
    setname= [num2str(social(i)),'_neutralsound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    first_neutralsound_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:10000],'Ytick',[-0.5:0.5:1.5],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 10000 -0.5 1.5]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(first_aversivesound_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(first_neutralsound_alone(:,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(first_aversivesound_social(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  solid grey
plot(EEG.times, squeeze(mean(first_neutralsound_social(:,1,:),1)),'-.','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  dashdot grey 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Arial'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('sound in first half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\study\the data\EADanalysis\raw data\sound_firsthalf.pdf'); % Write current figure to prosocial.pdf file,

%% plot for second half
% cue: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivecue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_aversivecue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% cue: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralcue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralcue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: socialaversive
for i=1:length(social)
    setname= [num2str(social(i)),'_aversivecue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_aversivecue_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: socialneutral
for i=1:length(social)
    setname= [num2str(social(i)),'_neutralcue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralcue_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:7000],'Ytick',[-0.2:0.1:0.3],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 7000 -0.2 0.3]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(second_aversivecue_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(second_neutralcue_alone(:,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(second_aversivecue_social(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(second_neutralcue_social(:,1,:),1)),'-.','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g dashdot green 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Arial'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('cue in second half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\study\the data\EADanalysis\raw data\cue_secondhalf.pdf'); % save current figure

% sound: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivesound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_aversivesound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% sound: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralsound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralsound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: socialaversive
for i=1:length(social)
    setname= [num2str(social(i)),'_aversivesound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_aversivesound_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: socialneutral
for i=1:length(social)
    setname= [num2str(social(i)),'_neutralsound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralsound_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:10000],'Ytick',[-0.5:0.5:1.5],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 10000 -0.5 1.5]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(second_aversivesound_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(second_neutralsound_alone(:,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(second_aversivesound_social(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(second_neutralsound_social(:,1,:),1)),'-.','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g dashdot green 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Arial'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('sound in second half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\study\the data\EADanalysis\raw data\sound_secondhalf.pdf'); % Write current figure to prosocial.pdf file,

%% plot for third block
% cue: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivecue_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_aversivecue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% cue: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralcue_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_neutralcue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: socialaversive
for i=1:length(social)
    setname= [num2str(social(i)),'_aversivecue_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_aversivecue_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: socialneutral
for i=1:length(social)
    setname= [num2str(social(i)),'_neutralcue_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_neutralcue_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:1000:7000],'Ytick',[-0.2:0.1:0.3],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 7000 -0.2 0.3]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(third_aversivecue_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(third_neutralcue_alone(:,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(third_aversivecue_social(:,1,:),1)),'-g','LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(third_neutralcue_social(:,1,:),1)),'-.g','LineWidth',3); % plot(x,y)  -g dashdot green 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Times New Roman'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('cue in third block','fontname','Times New Roman','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Times New Roman','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Times New Roman','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\EADanalysis\raw data\cue_thirdblock.tif'); % save current figure

% sound: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivesound_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_aversivesound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% sound: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralsound_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_neutralsound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: socialaversive
for i=1:length(social)
    setname= [num2str(social(i)),'_aversivesound_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_aversivesound_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: socialneutral
for i=1:length(social)
    setname= [num2str(social(i)),'_neutralsound_thirdblock','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    third_neutralsound_social(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:1000:10000],'Ytick',[-0.5:0.2:1.5],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 10000 -0.5 1.5]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(third_aversivesound_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(third_neutralsound_alone(:,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(third_aversivesound_social(:,1,:),1)),'-g','LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(third_neutralsound_social(:,1,:),1)),'-.g','LineWidth',3); % plot(x,y)  -g dashdot green 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Times New Roman'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('sound in third block','fontname','Times New Roman','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Times New Roman','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Times New Roman','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\EADanalysis\raw data\sound_thirdblock.tif'); % Write current figure to prosocial.pdf file,













%%  plot for anticipation period
Cond={'S 11'  'S 21' };
% input data in alone condition
alone=[1]; % subject number
for i=1:length(alone)
    setname= [num2str(alone(i)),'_anticipation','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);   
    for j=1:2  
    alone_cue = pop_selectevent( EEG, 'type',Cond(j));% Find events in an EEG dataset.   pop_selectevent( EEG, 'key1', value1, ...'key2', value2, ... );
    alone_cue = pop_rmbase( alone_cue, [-1000     0]); 
    cue_alone(i,j,:,:)=squeeze(mean(alone_cue.data,3));  % make average on trials
    end 
end

social=[19 20 22 24 25 27 28 29 30 31 34 36 39 41 66 75 76 43 45 46 47 48 50 51 52 54 55 57 58 60 61 62]; % subject number
for i=1:length(social)
    setname= [num2str(social(i)),'_anticipation','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);   
    for j=1:2  
    social_cue = pop_selectevent( EEG, 'type',Cond(j));% Find events in an EEG dataset.   pop_selectevent( EEG, 'key1', value1, ...'key2', value2, ... );
    social_cue = pop_rmbase( social_cue, [-1000     0]); 
    cue_social(i,j,:,:)=squeeze(mean(social_cue.data,3));  % make average on trials
    end 
end
% plot 
times = EEG.times; % time windows
save data_all cue_alone cue_social times 
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:1000:7000],'Ytick',[-0.1:0.02:0.1],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 8000 -0.1 0.1]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(cue_alone(:,1,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(cue_alone(:,2,1,:),1)),'-.k','LineWidth',3); % plot(x,y)  -g dashdot black 
plot(EEG.times, squeeze(mean(cue_social(:,1,1,:),1)),'-g','LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(cue_social(:,2,1,:),1)),'-.g','LineWidth',3); % plot(x,y)  -g dashdot green 
legend({'alone aversive',  'alone neutral', 'social aversive',  'social neutral'},'fontsize',22,'fontname','Times New Roman'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('Cz for prosocials','fontname','Times New Roman','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Times New Roman','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Times New Roman','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\EADanalysis\raw data\cue.tif'); % Write current figure to prosocial.pdf file,



%% plot group-level ERP (waveform) for individualistics
%%%%%% input data %%%%%%%
indivi=[4 6 7 11 15 20 23 25 29 32 35 36 37 38 39 40 42 43]; 
Cond={'S 11'  'S 12'  'S 13'};
for i=1:length(indivi) 
    setname= [num2str(indivi(i)),'-SC','.set']; % EEGLAB数据的文件
    EEG = pop_loadset(setname);
    for j=1:length(Cond) 
     EEG_anticipation = pop_selectevent( EEG, 'type',Cond(j));%挑取特定条件marker
        EEG_anticipation = pop_rmbase( EEG_anticipation, [-100     0]); 
        data_indivi(i,j,:,:)=squeeze(mean(EEG_anticipation.data,3));  %% data_indivi为subj*cond*channel*timepoints,右边矩阵的两个维度的值会分别被赋予左边矩阵两个:的位置
    end 
end

%%%%%% plot %%%%%%
times = EEG.times;
chan = EEG.chanlocs;
save data_all data_indivi times chan
figure; 
hold on;%不覆盖画图
set(gca,'YDir','reverse','Xtick',[-100:100:800],'Ytick',[-5:5:15],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-100 800 -5 15]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(data_indivi(:,1,18,:),1)),'-r','LineWidth',3); % 所有被试S 11条件Cz平均波形
plot(EEG.times, squeeze(mean(data_indivi(:,2,18,:),1)),'-g','LineWidth',3); % 所有被试S 12条件Cz平均波形
plot(EEG.times, squeeze(mean(data_indivi(:,3,18,:),1)),'-b','LineWidth',3); % 所有被试S 13条件Cz平均波形
legend('S 11',  'S 12',  'S 13'); %图例legend({'S 11',  'S 12',  'S 13'},'fontsize',22,'fontname','Times New Roman'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('Cz for individualistic','fontname','Times New Roman','fontsize',25); %%  TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Times New Roman','fontsize',22); %% name of X axis
ylabel('Amplitude (uV)','fontname','Times New Roman','fontsize',22);  %% name of Y axis
saveas(gcf,'F:\qiyy\experiment\social conformity\EEGstudy of social conformity\data\eeg data\sc\individualistics.pdf'); %% 保存当前图片，命名为'individualistic'

%%%%%% output the data %%%%%%
for i =1:length(indivi)
    time_window=find((EEG.times>=400)&(EEG.times<=460)); %% define the time intervals
    indivi_condition_1=squeeze(mean(data_indivi(i,1,18,time_window),4)); %% select each subject,condition S 11,data in [197 217]ms for 18 channel
    indivi_condition_2=squeeze(mean(data_indivi(i,2,18,time_window),4)); %% select each subjects,condition S 12,data in [197 217]ms for 18 channel
    indivi_condition_3=squeeze(mean(data_indivi(i,3,18,time_window),4)); %% select each subjects,condition S 12,data in [197 217]ms for 18 channel
    fprintf('%d\t%d\t%d\n',indivi_condition_1,indivi_condition_2,indivi_condition_3);
end

%% plot the scalp maps at dominant peaks
N2_peak=find(EEG.times==450);  %% dominant peaks on waveforms  来找450ms对应的样本点，450ms是选出来的峰值

% for prosocials
figure; 
subplot(131); topoplot(squeeze(mean(data_cue(:,1,:,N2_peak),1)),EEG.chanlocs, 'maplimits',[-10 10]); colorbar; title('11','fontsize',16); %% N2 11条件下 prosocial组(group-level)
subplot(132); topoplot(squeeze(mean(data_cue(:,2,:,N2_peak),1)),EEG.chanlocs, 'maplimits',[-10 10]); colorbar; title('12','fontsize',16); %% N2 12条件下 prosocial组(group-level)
subplot(133); topoplot(squeeze(mean(data_cue(:,3,:,N2_peak),1)),EEG.chanlocs, 'maplimits',[-10 10]); colorbar; title('13','fontsize',16); %% N2 13条件下 prosocial组(group-level)
saveas(gcf,'F:\qiyy\experiment\social conformity\EEGstudy of social conformity\data\eeg data\sc\prosocial-topograph.pdf'); %% 保存当前图片类型为pdf，命名为'prosocial-topograph'

% for individualistics
figure; %subplot(131)/subplot(132)/subplot(133)为图的布局，即在一张图上放张图。
subplot(131); topoplot(squeeze(mean(data_indivi(:,1,:,N2_peak),1)),EEG.chanlocs,'maplimits',[-10 10]); colorbar; title('11','fontsize',16); %% N2 11条件下 individualistics组(group-level)
subplot(132); topoplot(squeeze(mean(data_indivi(:,2,:,N2_peak),1)),EEG.chanlocs,'maplimits',[-10 10]); colorbar; title('12','fontsize',16); %% N2 12条件下 individualistics组(group-level)
subplot(133); topoplot(squeeze(mean(data_indivi(:,3,:,N2_peak),1)),EEG.chanlocs,'maplimits',[-10 10]); colorbar; title('13','fontsize',16); %% N2 13条件下 individualistics组(group-level)
saveas(gcf,'F:\qiyy\experiment\social conformity\EEGstudy of social conformity\data\eeg data\sc\individualistics-topograph.pdf'); %% 保存当前图片类型为pdf，命名为'individualistics-topography'


