%% topoplotER
plot_cfg = [];
plot_cfg.layout = 'neuromag306mag.lay';
plot_cfg.xlim = [-0.1:0.1:0.8];
plot_cfg.colorbar = 'yes';
plot_cfg.marker = 'off';
plot_cfg.comment = 'xlim';
plot_cfg.commentpos = 'lefttop';
ft_topoplotER(plot_cfg,ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_topoplotER.png']);
close all;