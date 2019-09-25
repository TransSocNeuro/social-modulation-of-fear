% social buffering
% aversive neutral: 27 trials in each condition
% %%%%%%%%%  Markers for ERPs  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anticipation aversive cue 11, neutral cue 21.
% post sound  aversive sound 13 31, neutral sound 23 41
% subjects in alone condition: 1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81
% subjects ingroup condition: 19 20 22 24 25 27 28 29 30 31 34 36 39 41 43 45 46 47 48 50 51 52 54 55 57 58 59 60 61 62 66 75 76 79 80 
% subjects in outgroup: 103:105 107:118 120:122 124:131 133 134 136 137 139
% low anxiety: alone 5 8 9 10 13 18 32 56 65 68 69 71 72 73 74 81; ingroup:22 24 25 27 28 30 34 43 51 52 54 58 60 61 62 66 75 76 79 80
% outgroup 103 104 107 108 112 113 115 116 117 120 122 125 128 133 134 137
% high anxiety: alone: 1 4 7 12 14 15 16 17 26 33 42 63 64 67 78 
% ingroup: 19 20 29 31 36 39 41 45 46 47 48 50 55 57 59 
% outgroup: 105 109 110 111 114 118 121 124 126 127 129 130 131 136 139

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
%% define the path of the folder
base_dir=strcat('D:\study\In Germany\social buffering_outgroup\EMG\raw data')
cd (base_dir)
% start EEGLAB under Matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 
alone=[5 8 9 10 13 18 32 56 65 68 69 71 72 73 74 81]; % subject number 
ingroup=[22 24 25 27 28 30 34 43 51 52 54 58 60 61 62 66 75 76 79 80];
outgroup = [103 104 107 108 112 113 115 116 117 120 122 125 128 133 134 137];
%% plot for first half
% cue: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivecue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_aversivecue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% cue: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralcue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_neutralcue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: ingroupaversive
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_aversivecue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_aversivecue_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: ingroupneutral
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_neutralcue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_neutralcue_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: outgroupaversive
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_aversivecue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_aversivecue_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: outgroupneutral
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_neutralcue_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_neutralcue_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:7000],'Ytick',[-0.2:0.1:0.3],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 7000 -0.2 0.3]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(first_aversivecue_alone(:,1,:),1))-squeeze(mean(first_neutralcue_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -k  black  
plot(EEG.times, squeeze(mean(first_aversivecue_ingroup(:,1,:),1))-squeeze(mean(first_neutralcue_ingroup(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  0.7 0.7 0.7 grey 'LineType','-'
plot(EEG.times, squeeze(mean(first_aversivecue_outgroup(:,1,:),1))-squeeze(mean(first_neutralcue_outgroup(:,1,:),1)),'-','Color',[0.2 0.7 0.7],'LineWidth',3); % plot(x,y) 'LineType','-' 
legend({'alone','ingroup','outgroup'},'fontsize',22,'fontname','Arial','Location','EastOutside'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('anticipation(aversive-neutral)-first half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\social buffering_outgroup\EMG\raw data\cue_firsthalf.pdf'); % save current figure

% sound: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivesound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_aversivesound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% sound: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralsound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_neutralsound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: ingroupaversive
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_aversivesound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_aversivesound_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: ingroupneutral
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_neutralsound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_neutralsound_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: outgroupaversive
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_aversivesound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_aversivesound_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: outgroupneutral
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_neutralsound_firsthalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    first_neutralsound_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:10000],'Ytick',[-0.3:0.3:1.2],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 10000 -0.3 1.2]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(first_aversivesound_alone(:,1,:),1))-squeeze(mean(first_neutralsound_alone(:,1,:),1)),'-','Color',[0 0 0],'LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(first_aversivesound_ingroup(:,1,:),1))-squeeze(mean(first_neutralsound_ingroup(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  solid grey
plot(EEG.times, squeeze(mean(first_aversivesound_outgroup(:,1,:),1))-squeeze(mean(first_neutralsound_outgroup(:,1,:),1)),'-','Color',[0.2 0.7 0.7],'LineWidth',3); % plot(x,y) 'LineType','-' 
legend({'alone', 'ingroup','outgroup'},'fontsize',22,'fontname','Arial'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('sounds in first half-lowanxiety','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\social buffering_outgroup\EMG\raw data\sound_firsthalf-lowanxiety.pdf'); % Write current figure to prosocial.pdf file,

%% plot for second half
% cue: aloneaversive
for i=1:length(alone)
    setname= [num2str(alone(i)),'_aversivecue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    second_aversivecue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 

% cue: aloneneutral
for i=1:length(alone)
    setname= [num2str(alone(i)),'_neutralcue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralcue_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: ingroupaversive
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_aversivecue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_aversivecue_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: ingroupneutral
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_neutralcue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralcue_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end
% cue: outgroupaversive
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_aversivecue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_aversivecue_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% cue: outgroupneutral
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_neutralcue_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]); 
    second_neutralcue_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:7000],'Ytick',[-0.2:0.1:0.3],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 7000 -0.2 0.3]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(second_aversivecue_alone(:,1,:),1)) - squeeze(mean(second_neutralcue_alone(:,1,:),1)),'-','Color',[0 0 0],'LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(second_aversivecue_ingroup(:,1,:),1)) - squeeze(mean(second_neutralcue_ingroup(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(second_aversivecue_outgroup(:,1,:),1)) - squeeze(mean(second_neutralcue_outgroup(:,1,:),1)),'-','Color',[0.2 0.7 0.7],'LineWidth',3); % plot(x,y) 'LineType','-' 
legend({'alone',   'ingroup',  'outgroup'},'fontsize',22,'fontname','Arial','Location','EastOutside'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('cue in second half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\social buffering_outgroup\EMG\raw data\cue_secondhalf.pdf'); % save current figure

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
    second_neutralsound_alone(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: ingroupaversive
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_aversivesound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    second_aversivesound_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: ingroupneutral
for i=1:length(ingroup)
    setname= [num2str(ingroup(i)),'_neutralsound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    second_neutralsound_ingroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: outgroupaversive
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_aversivesound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    second_aversivesound_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
% sound: outgroupneutral
for i=1:length(outgroup)
    setname= [num2str(outgroup(i)),'_neutralsound_secondhalf','.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    second_neutralsound_outgroup(i,:,:)=squeeze(mean(EEG.data,3));  % make average on trials
end 
times = EEG.times; % time windows
figure; %
hold on; %holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph.
set(gca,'Xtick',[-1000:2000:10000],'Ytick',[-0.3:0.5:1.2],'fontsize',18); %to set the reverse Y Direction in the current figure window
axis([-1000 10000 -0.3 1.2]);%AXIS([XMIN XMAX YMIN YMAX])
plot(EEG.times, squeeze(mean(second_aversivesound_alone(:,1,:),1))-squeeze(mean(second_neutralsound_alone(:,1,:),1)),'-k','LineWidth',3); % plot(x,y)  -b  solid black  
plot(EEG.times, squeeze(mean(second_aversivesound_ingroup(:,1,:),1))-squeeze(mean(second_neutralsound_ingroup(:,1,:),1)),'-','Color',[0.7 0.7 0.7],'LineWidth',3); % plot(x,y)  -g solid green
plot(EEG.times, squeeze(mean(second_aversivesound_outgroup(:,1,:),1))-squeeze(mean(second_neutralsound_outgroup(:,1,:),1)),'-','Color',[0.2 0.7 0.7],'LineWidth',3); % plot(x,y) 'LineType','-' 
legend({'alone', 'ingroup', 'outgroup'},'fontsize',22,'fontname','Arial'); %  LEGEND(string1,string2,string3, ...) puts a legend on the current plot
legend('boxoff')
title('sound in second half','fontname','Arial','fontsize',25); % TITLE('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)sets the values of the specified properties of the title.
xlabel('Latency (ms)','fontname','Arial','fontsize',22); % name of X axis
ylabel('Amplitude (us)','fontname','Arial','fontsize',22);  % name of Y axis
saveas(gcf,'D:\study\In Germany\social buffering_outgroup\EMG\raw data\sound_secondhalf.pdf'); % Write current figure to prosocial.pdf file,

