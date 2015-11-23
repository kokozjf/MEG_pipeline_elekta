%% find trigger, run it separately
clear all

trigger_cfg = [];
trigger_cfg.dataset = 'D:\MEG\pku_data\data\151116\vef_gabor_counting_HL_sss.fif'; 
trigger_cfg.trialdef.eventtype = '?';
ft_definetrial(trigger_cfg);