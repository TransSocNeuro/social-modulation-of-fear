% social buffering
% aversive neutral: 27 trials in each condition
% %%%%%%%%%  Markers for ERPs  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anticipation aversive cue 11, neutral cue 21.
% post sound  aversive sound 13 31, neutral sound 23 41
% subject number:
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
% the folder
base_dir=strcat('D:\study\In Germany\study\the data\EADanalysis\raw data'); %STRCAT Concatenate strings.
cd (base_dir);
% start EEGLAB under Matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 
sub = [1 04 05 07 08 09  10 12:20 22 24:34 36 39 41:43 45:48 50:52 54:69 71:76 78:81];

%% export averaged value and trial by trial value for the first/second half
% aversive cue
for i=1:length(sub)
    setname= [num2str(sub(i)),'_aversivecue_secondhalf.mat']; % EEGLAB data the file name or '_aversivecue_firsthalf.mat'
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    aversive_cue(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    a=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials
    filename=[num2str(sub(i)),'_aversivecue_secondhalf','.csv']; % for trial trial data export
    csvwrite(filename,a)
end
% neutral cue
for i=1:length(sub)
    setname= [num2str(sub(i)),'_neutralcue_secondhalf.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    neutral_cue(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    b=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  %% the structure of EEG.data: the number of electord*time*trials
    filename=[num2str(sub(i)),'_neutralcue_secondhalf','.csv']; % for trial by trial data export
    csvwrite(filename,b)
end
% aversive sound
for i=1:length(sub)
    setname= [num2str(sub(i)),'_aversivesound_secondhalf.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    aversive_sound(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000));
    c=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials
    filename=[num2str(sub(i)),'_aversivesound_secondhalf','.csv']; % for trial by trial data export
    csvwrite(filename,c)
end   
% neutral sound
for i=1:length(sub)
    setname= [num2str(sub(i)),'_neutralsound_secondhalf.mat']; % EEGLAB data the file name
    EEG = pop_loadset(setname);
    EEG = pop_rmbase( EEG, [-1000     0]);
    neutral_sound(i,:,:)=squeeze(mean(EEG.data,3));
    time_window=find((EEG.times>=2500)&(EEG.times<=6000));
    d=squeeze( mean( EEG.data( :, time_window, : ), 2 ) );  % the structure of EEG.data: the number of electord*time*trials
    filename=[num2str(sub(i)),'_neutralsound_secondhalf','.csv']; % for trial by trial data export
    csvwrite(filename,d)
end

% output the data 
for i =1:length(sub)
    cue_time=find((EEG.times>=2500)&(EEG.times<=6000)); % define the time intervals
    sound_time=find((EEG.times>=2500)&(EEG.times<=6000));
    aversivecue=squeeze(mean(aversive_cue(i,1,cue_time),3)); 
    neutralcue=squeeze(mean(neutral_cue(i,1,cue_time),3)); 
    aversivesound=squeeze(mean(aversive_sound(i,1,sound_time),3)); 
    neutralsound=squeeze(mean(neutral_sound(i,1,sound_time),3));
    fprintf('%d\t%d\t%d\t%d\n',aversivecue,neutralcue,aversivesound,neutralsound);
end