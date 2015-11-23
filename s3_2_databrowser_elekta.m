%% databrowser
cfg = [];
cfg.viewmode = 'butterfly';
cfg.colorgroups = 'allblack';
ft_databrowser(cfg, ERF);
saveas(gcf,['figure' filesep MEG_file{MEG_num} '_databrowser.png']);
close all;