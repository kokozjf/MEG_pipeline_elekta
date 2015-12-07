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

% save([MEG_file{MEG_num} '.mat'], 'ERF', '-append');


% %% planar grad
% cfg = [];
% % cfg.feedback = 'yes';
% % cfg.method = 'template';
% % cfg.neighbours = ft_prepare_neighbours(cfg,ERF_);
% % 
% % cfg.planarmethod = 'sincos';
% ERF_planar = ft_combineplanar(cfg, ERF); 
% 
% 
% %% topoplotER
% cfg = [];
% % cfg.layout = 'neuromag306mag.lay';
% % cfg.layout = 'neuromag306planar.lay';
% % cfg.xlim = [-0.1:0.1:1.4]; %aef
% cfg.xlim = [-0.1:0.1:0.8]; %vef
% % cfg.zlim = [-1*1e-13 1*1e-13];
% cfg.colorbar = 'yes';
% cfg.marker = 'off';
% cfg.comment = 'xlim';
% cfg.commentpos = 'lefttop';
% ft_topoplotER(cfg,ERF_planar);
% % saveas(gcf,['figure' filesep MEG_file{MEG_num} '_topoplotER.png']);
% % close all;