clear all;


%% information setting
MEG_dataset  = '/media/jianfeng/data/MEG/pku_data/data/151116/';
MEG_file = 'vef_gabor_counting_HL_sss.fif';
MRI_dataset  = '/media/jianfeng/data/MEG/pku_data/data/003_Sag_3D_T1BRAVO';

trigger_value =61450;

addpath('/media/jianfeng/data/MEG/pipeline/MEG_pipeline_elekta');

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

cfg = [];
raw_ERF = ft_timelockanalysis(cfg, filting_data);

% check edge artifacts
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
ft_databrowser(cfg, raw_ERF);
saveas(gcf,['figure' filesep MEG_file '_edge_artifacts_check.png']);
close all;



%% redefine trials within the time range of interest
cfg = [];
% cfg.toilim = [-0.1 1.4]; %aef
cfg.toilim = [-0.1 0.8]; %vef
redefine_data = ft_redefinetrial(cfg, filting_data);


%% ERF for further ananyzing
cfg = [];
% cfg.channel          = 'megmag';
cfg.channel          = 'MEG';
cfg.covariance       = 'yes';
cfg.covariancewindow = 'all';

ERF = ft_timelockanalysis(cfg, redefine_data);

%% multiplotER
cfg = [];
cfg.showoutline = 'yes';
% plot_cfg.layout = 'neuromag306all.lay';
cfg.layout = 'neuromag306mag.lay'; 
% plot_cfg.layout = 'neuromag306planar.lay'; 
cfg.marker = 'off';
plot_cfg.vlim = 'maxabs';
ft_multiplotER(cfg,ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_multiplotER.png']);
close all;

%% databrowser
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
ft_databrowser(cfg, ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_databrowser.png']);
close all;

%% topoplotER
cfg = [];
cfg.layout = 'neuromag306mag.lay';
cfg.xlim = [-0.1:0.1:1.4]; %aef
% cfg.xlim = [-0.1:0.1:0.8]; %vef
cfg.zlim = [-1*1e-13 1*1e-13];
cfg.colorbar = 'yes';
cfg.marker = 'off';
cfg.comment = 'xlim';
cfg.commentpos = 'lefttop';
ft_topoplotER(cfg,ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_topoplotER.png']);
close all;

%% planar analysis
cfg = [];
comb_planar = ft_combineplanar(cfg, redefine_data);


%% planar analysis without demean
cfg = [];
% cfg.demean = 'yes';
cfg.channel = 'meggrad';
planar_ERF = ft_timelockanalysis(cfg, comb_planar);

%% planar analysis with demean
cfg = [];
cfg.demean = 'yes';
cfg.channel = 'meggrad';
planar_ERF_demean = ft_timelockanalysis(cfg, comb_planar);


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
% cfg.xlim = [-0.1:0.1:1.4]; %aef
cfg.xlim = -0.1:0.1:0.8; %vef
cfg.zlim = [0 1*1e-11];
cfg.colorbar = 'yes';
cfg.colormap = 'jet';
cfg.marker = 'off';
cfg.comment = 'xlim';
cfg.commentpos = 'lefttop';
figure
ft_topoplotER(cfg, planar_ERF);
saveas(gcf,['figure' filesep MEG_file '_topoplotER_planar.png']);
close all;

%% demean
%% multiplotER
cfg = [];
cfg.showoutline = 'yes';
cfg.layout = 'neuromag306cmb.lay'; 
cfg.marker = 'off';
plot_cfg.vlim = 'maxabs';
figure
ft_multiplotER(cfg,planar_ERF_demean);
saveas(gcf,['figure' filesep MEG_file '_multiplotER_demean_planar.png']);
close all;

%% databrowser
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
ft_databrowser(cfg, planar_ERF_demean);
saveas(gcf,['figure' filesep MEG_file '_databrowser_demean_planar.png']);
close all;

%% topoplotER
cfg = [];
cfg.layout = 'neuromag306cmb.lay';
% cfg.xlim = [-0.1:0.1:1.4]; %aef
cfg.xlim = -0.1:0.1:0.8; %vef
cfg.zlim = [-1.5*1e-12 1.5*1e-12];
cfg.colorbar = 'yes';
cfg.colormap = 'jet';
cfg.marker = 'off';
cfg.comment = 'xlim';
cfg.commentpos = 'lefttop';
figure
ft_topoplotER(cfg, planar_ERF_demean);
saveas(gcf,['figure' filesep MEG_file '_topoplotER_demean_planar.png']);
close all;
