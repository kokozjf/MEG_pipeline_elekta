%% topoplotER
plot_cfg = [];
plot_cfg.layout = 'neuromag306mag.lay';
% plot_cfg.xlim = [-0.1:0.1:1.4]; %aef
plot_cfg.xlim = [-0.1:0.1:0.8]; %vef
plot_cfg.colorbar = 'yes';
plot_cfg.marker = 'off';
plot_cfg.comment = 'xlim';
plot_cfg.commentpos = 'lefttop';
plot_cfg.zlim = [-1*1e-13 1*1e-13];
ft_topoplotER(plot_cfg,ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_topoplotER.png']);
close all;