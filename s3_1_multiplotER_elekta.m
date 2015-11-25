%% multiplotER
plot_cfg = [];
plot_cfg.showoutline = 'yes';
% plot_cfg.layout = 'neuromag306all.lay';
plot_cfg.layout = 'neuromag306mag.lay'; 
% plot_cfg.layout = 'neuromag306planar.lay'; 
plot_cfg.marker = 'off';
% plot_cfg.vlim = 'maxabs';
ft_multiplotER(plot_cfg,ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_multiplotER.png']);
close all;