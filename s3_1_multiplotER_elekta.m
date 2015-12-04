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