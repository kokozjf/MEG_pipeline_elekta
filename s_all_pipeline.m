clear all;

%% information setting

% %%% subj001
% MEG_dataset  = '../MEG/151111/';
% MEG_file = 'VEF_20151111_WYY_sss.fif';
% MRI_dataset  = '../MRI/wangyuanye';
% trigger_value =61450;

% %%% subj002
% MEG_dataset  = '../MEG/151116/';
% MEG_file = 'vef_gabor_counting_HL_sss.fif';
% MRI_dataset  = '../MRI/wangyuanye';
% trigger_value =61450;

% %%% subj003
% MEG_dataset  = '../MEG/151202/';
% MEG_file = 'qiangli_huang_vef_sss.fif';
% trigger_value =10;

% %%% subj004
% MEG_dataset  = '../MEG/151116/';
% MEG_file = 'aef_1000Hz_counting_HL_sss.fif';
% trigger_value =61443;

%%% subj005
MEG_dataset  = '../MEG/151202/';
MEG_file = 'qiaoli_huang_aef_sss.fif';
trigger_value =3;

addpath('.');

cd(MEG_dataset);
mkdir('figure');


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

% redefine trials within the time range of interest
cfg = [];
% cfg.toilim = [-0.1 0.8]; %vef
cfg.toilim = [-0.1 1.4]; %aef
redefine_data = ft_redefinetrial(cfg, filting_data);

%% ERF 
cfg = [];
cfg.channel          = 'MEG';
cfg.covariance       = 'yes';
cfg.covariancewindow = 'all';
ERF = ft_timelockanalysis(cfg, redefine_data);

%  ERF multiplotER
cfg = [];
cfg.showoutline = 'yes';
cfg.layout = 'neuromag306mag.lay'; 
% plot_cfg.layout = 'neuromag306all.lay';
% plot_cfg.layout = 'neuromag306planar.lay'; 
% plot_cfg.layout = 'neuromag306cmb.lay'; 
cfg.marker = 'off';
plot_cfg.vlim = 'maxabs';
ft_multiplotER(cfg,ERF);
saveas(gcf,['figure' filesep MEG_file 'mag_multiplotER.png']);
close all;

%  ERF databrowser
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
cfg.channel = 'megmag';
ft_databrowser(cfg, ERF);
saveas(gcf,['figure' filesep MEG_file 'mag_databrowser.png']);
close all;

%  ERF topoplotER
cfg = [];
cfg.layout = 'neuromag306mag.lay';
cfg.xlim = [-0.1:0.1:1.4]; %aef
% cfg.xlim = [-0.1:0.1:0.8]; %vef
cfg.zlim = [-1*1e-13 1*1e-13];
cfg.colorbar = 'yes';
cfg.colormap = 'jet';
cfg.marker = 'off';
cfg.comment = 'xlim';
cfg.commentpos = 'lefttop';
ft_topoplotER(cfg,ERF);
saveas(gcf,['figure' filesep MEG_file 'mag_topoplotER.png']);
close all;

%% planar analysis
cfg = [];
planar_ERF = ft_combineplanar(cfg, ERF);

%% multiplotER
cfg = [];
cfg.showoutline = 'yes';
cfg.layout = 'neuromag306cmb.lay'; 
cfg.marker = 'off';
plot_cfg.vlim = 'maxabs';
figure
ft_multiplotER(cfg,planar_ERF);
saveas(gcf,['figure' filesep MEG_file '_multiplotER_planar.png']);
close all;

%% databrowser
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
ft_databrowser(cfg, planar_ERF);
saveas(gcf,['figure' filesep MEG_file '_databrowser_planar.png']);
close all;

%% topoplotER
cfg = [];
cfg.layout = 'neuromag306cmb.lay';
cfg.xlim = [-0.1:0.1:1.4]; %aef
% cfg.xlim = -0.1:0.1:0.8; %vef
cfg.zlim = [0 4*1e-12];
cfg.colorbar = 'yes';
cfg.colormap = 'jet';
cfg.marker = 'off';
cfg.comment = 'xlim';
cfg.commentpos = 'lefttop';
ft_topoplotER(cfg, planar_ERF);
saveas(gcf,['figure' filesep MEG_file '_topoplotER_planar.png']);
close all;
