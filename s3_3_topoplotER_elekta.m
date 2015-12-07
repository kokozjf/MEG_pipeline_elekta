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