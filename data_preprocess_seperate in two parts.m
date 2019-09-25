% social buffering
% aversive neutral: 27 trials in each condition
% %%%%%%%%%  Markers for ERPs  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anticipation aversive cue 11, neutral cue 21.
% post sound  aversive sound 13 31, neutral sound 23 41
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% subject number outgroup: 103:105 107:118 120:122 124:131 133 134 136 137 139
% ingroup: 19 20 22 24 25 27 28 29 30 31 34 36 39 41 43 45 46 47 48 50 51 52 54 55 57 58 59 60 61 62 66 75 76 79 80
% alone: 1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81
clear all;
clc;
%%the folder
base_dir=strcat('D:\study\In Germany\social buffering_outgroup\EMG\raw data') %STRCAT Concatenate strings.
cd (base_dir) 
% start EEGLAB under Matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 
%% 
for sub=[134 136 137 139] 
    disp(['doing subject ',num2str(sub)]);
% read in the BP dataset
    subnum= [num2str(sub),'.vhdr']; %the dataset name 
    EEG = pop_loadbv(base_dir,subnum); % pop_loadbv(path to files, name of Brain Vision vhdr-file )
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',strcat('sub',int2str (sub)),'gui','off'); % 'setname' - ['string'] name for the new dataset
% data filter
    EEG = eeg_checkset( EEG );
    EEG = pop_eegfilt( EEG, 0, 1, []); %lower filter 1Hz
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET); % copy changes to ALLEEG   
    save([num2str(sub),'_for_epoch.mat'],'EEG');  
end

%% seperate data in two parts
 first_half = (14:27);
 second_half = (1:13);
% cue: aversive
for sub = [1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 11'  }, [-1 7], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    % first half
    binarized1=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized1(first_half)=1;
    EEG = pop_rejepoch(EEG,binarized1,0);% pop_rejepoch( INEEG, trialrej, confirm) trialrej-Array of 0s and 1s (depicting rejected trials) (size is number of trials)
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_aversivecue_firsthalf.set'],'EEG');
end   
    % second half
for sub = [1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 11'  }, [-1 7], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks 
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    binarized2=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized2(second_half)=1;
    EEG = pop_rejepoch(EEG,binarized2,0);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_aversivecue_secondhalf.mat'],'EEG');
end
  
% cue: neutral
for sub = [1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 21'  }, [-1 7], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = pop_rmbase( EEG, [-1000    0]);
    EEG = eeg_checkset( EEG );
    % first half
    binarized1=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized1(first_half)=1;
    EEG = pop_rejepoch(EEG,binarized1,0);% pop_rejepoch( INEEG, trialrej, confirm) trialrej-Array of 0s and 1s (depicting rejected trials) (size is number of trials)
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_neutralcue_firsthalf.set'],'EEG');
end
    % second half
 for sub = [1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 21'  }, [-1 7], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = pop_rmbase( EEG, [-1000    0]);
    EEG = eeg_checkset( EEG );   
    binarized2=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized2(second_half)=1;
    EEG = pop_rejepoch(EEG,binarized2,0);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_neutralcue_secondhalf.mat'],'EEG');
 end
   
% sound: aversive 
for sub = [1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 31'  'S 13'}, [-1 10], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = pop_rmbase( EEG, [-1000    0]);
    EEG = eeg_checkset( EEG );
    % first half
    binarized1=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized1(first_half)=1;
    EEG = pop_rejepoch(EEG,binarized1,0);% pop_rejepoch( INEEG, trialrej, confirm) trialrej-Array of 0s and 1s (depicting rejected trials) (size is number of trials)
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_aversivesound_firsthalf.mat'],'EEG'); 
end
    % second half
for sub = [1 4 5 7 8 9 10 12 13 14 15 16 17 18 26 32 33 42 56 63 64 65 67 68 69 71 72 73 74 78 81]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 31'  'S 13'}, [-1 10], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = pop_rmbase( EEG, [-1000    0]);
    EEG = eeg_checkset( EEG );    
    binarized2=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized2(second_half)=1;
    EEG = pop_rejepoch(EEG,binarized2,0);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_aversivesound_secondhalf.mat'],'EEG');
end

% sound: neutral
for sub = [134 136 137 139]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 41'  'S 23'}, [-1 10], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = pop_rmbase( EEG, [-1000    0]);
    EEG = eeg_checkset( EEG );
    % first half
    binarized1=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized1(first_half)=1;
    EEG = pop_rejepoch(EEG,binarized1,0);% pop_rejepoch( INEEG, trialrej, confirm) trialrej-Array of 0s and 1s (depicting rejected trials) (size is number of trials)
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_neutralsound_firsthalf.mat'],'EEG');
end
    % second half
for sub = [134 136 137 139]    
    disp(['doing subject ',num2str(sub)]);
    load([num2str(sub),'_for_epoch.mat']);
    EEG = pop_epoch(EEG, {  'S 41'  'S 23'}, [-1 10], 'newname', strcat(sub,int2str(sub),' epochs'), 'epochinfo', 'yes');% select marks
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = pop_rmbase( EEG, [-1000    0]);
    EEG = eeg_checkset( EEG );
    binarized2=zeros(1,EEG.trials); % ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros
    binarized2(second_half)=1;
    EEG = pop_rejepoch(EEG,binarized2,0);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    save([num2str(sub),'_neutralsound_secondhalf.mat'],'EEG');
end
   

