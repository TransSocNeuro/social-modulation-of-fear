% social buffering
% aversive neutral: 27 trials in each condition
% %%%%%%%%%  Markers for ERPs  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anticipation aversive cue 11, neutral cue 21.
% post sound  aversive sound 13 31, neutral sound 23 41
% subject number: 103:105 107:118 120:122 124:131 133 134 136 137 139
% ingroup and alone: 1 04 05 07 08 09  10 12:20 22 24:34 36 39 41:43 45:48 50:52 54:69 71:76 78:81
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% higher anxious:
%%% Note: Firstly, export data for first half and second half seperately, then test whether there is significant difference between two group. if
%%% there is, just use the first half, otherwise, use all the data

clear all;
clc;
% the folder
base_dir=strcat('D:\social buffering_outgroup\EMG\raw data'); %STRCAT Concatenate strings.
cd (base_dir);
% start EEGLAB under Matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 
sub = [15 16];

%% export averaged value and trial by trial value for the first half
% aversive cue
for i=1:length(sub)
    setname= [num2str(sub(i)),'_aversivecue_firsthalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    aversive_cue(i,:,:)=squeeze(mean(EEG.data,3)); % for averaged value 
    time_window=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    a=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials [for trial by trial value]
    filename=[num2str(sub(i)),'_aversivecue_firsthalf','.csv'];
    csvwrite(filename,a) %output trial by trial value for each subject
end
% neutral cue
for i=1:length(sub)
    setname= [num2str(sub(i)),'_neutralcue_firsthalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    neutral_cue(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    b=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  %% the structure of EEG.data: the number of electord*time*trials [for trial by trial value]
    filename=[num2str(sub(i)),'_neutralcue_firsthalf','.csv'];
    csvwrite(filename,b) %output trial by trial value for each subject
end
% aversive sound
for i=1:length(sub)
    setname= [num2str(sub(i)),'_aversivesound_firsthalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    aversive_sound(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000));
    c=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials [for trial by trial value]
    filename=[num2str(sub(i)),'_aversivesound_firsthalf','.csv'];
    csvwrite(filename,c) %output trial by trial value for each subject
end   
% neutral sound
for i=1:length(sub)
    setname= [num2str(sub(i)),'_neutralsound_firsthalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    neutral_sound(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000));
    d=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials [for trial by trial data]
    filename=[num2str(sub(i)),'_neutralsound_firsthalf','.csv'];
    csvwrite(filename,d) %output trial by trial value for each subject
end

% output the averaged (average all trials) data
for i =1:length(sub)
    cue_time=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    sound_time=find((EEG.times>=2500)&(EEG.times<=6000));
    aversivecue=squeeze(mean(aversive_cue(i,1,cue_time),3)); 
    neutralcue=squeeze(mean(neutral_cue(i,1,cue_time),3)); 
    aversivesound=squeeze(mean(aversive_sound(i,1,sound_time),3)); 
    neutralsound=squeeze(mean(neutral_sound(i,1,sound_time),3));
    fprintf('%d\t%d\t%d\t%d\n',aversivecue,neutralcue,aversivesound,neutralsound);
end

%% second half
% aversive cue
for i=1:length(sub)
    setname= [num2str(sub(i)),'_aversivecue_secondhalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    aversive_cue(i,:,:)=squeeze(mean(EEG.data,3)); % for averaged value 
    time_window=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    a=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials [for trial by trial value]
    filename=[num2str(sub(i)),'_aversivecue_secondhalf','.csv'];
    csvwrite(filename,a) %output trial by trial value for each subject
end
% neutral cue
for i=1:length(sub)
    setname= [num2str(sub(i)),'_neutralcue_secondhalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    neutral_cue(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    b=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  %% the structure of EEG.data: the number of electord*time*trials [for trial by trial value]
    filename=[num2str(sub(i)),'_neutralcue_secondhalf','.csv'];
    csvwrite(filename,b) %output trial by trial value for each subject
end
% aversive sound
for i=1:length(sub)
    setname= [num2str(sub(i)),'_aversivesound_secondhalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    aversive_sound(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000));
    c=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials [for trial by trial value]
    filename=[num2str(sub(i)),'_aversivesound_secondhalf','.csv'];
    csvwrite(filename,c) %output trial by trial value for each subject
end   
% neutral sound
for i=1:length(sub)
    setname= [num2str(sub(i)),'_neutralsound_secondhalf.mat']; % the file name generated from the preprocess
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    neutral_sound(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000));
    d=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials [for trial by trial data]
    filename=[num2str(sub(i)),'_neutralsound_secondhalf','.csv'];
    csvwrite(filename,d) %output trial by trial value for each subject
end

% output the averaged (average all trials) data
for i =1:length(sub)
    cue_time=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    sound_time=find((EEG.times>=2500)&(EEG.times<=6000));
    aversivecue=squeeze(mean(aversive_cue(i,1,cue_time),3)); 
    neutralcue=squeeze(mean(neutral_cue(i,1,cue_time),3)); 
    aversivesound=squeeze(mean(aversive_sound(i,1,sound_time),3)); 
    neutralsound=squeeze(mean(neutral_sound(i,1,sound_time),3));
    fprintf('%d\t%d\t%d\t%d\n',aversivecue,neutralcue,aversivesound,neutralsound);
end
