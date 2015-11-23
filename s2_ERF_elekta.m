%% redefine trials within the time range of interest
cfg = [];
cfg.toilim = [-0.1 0.8];
redefine_data = ft_redefinetrial(cfg, filting_data);

%% ERF for further ananyzing
cfg = [];
cfg.channel          = 'megmag';
cfg.covariance       = 'yes';
cfg.covariancewindow = 'all';

ERF = ft_timelockanalysis(cfg, redefine_data);

% save([MEG_file{MEG_num} '.mat'], ERF, '-append');
