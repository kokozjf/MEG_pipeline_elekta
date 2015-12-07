%% preprocessing cfg

% define trials
cfg = [];
cfg.dataset = MEG_file; 
cfg.trialdef.eventtype = 'STI101';
cfg.trialdef.eventvalue = trigger_value;
cfg.trialdef.prestim    = 1;
cfg.trialdef.poststim   = 2; 
cfg.channel = 'meg';
% cfg.channel = 'megmag';
cfg = ft_definetrial(cfg);
raw_data = ft_preprocessing(cfg);

% bandpass filter
cfg = [];
cfg.demean = 'yes';
cfg.bpfilter = 'yes';
cfg.bpfreq = [1 35]; 
filting_data = ft_preprocessing(cfg,raw_data);

cfg = [];
raw_ERF = ft_timelockanalysis(cfg, filting_data);

% check edge artifacts
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
ft_databrowser(cfg, raw_ERF);
saveas(gcf,['figure' filesep MEG_file '_edge_artifacts_check.png']);
close all;

% save([MEG_file '.mat']);