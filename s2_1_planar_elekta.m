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
