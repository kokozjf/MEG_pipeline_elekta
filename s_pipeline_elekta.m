clear all;
% MEG_dataset = importdata('D:\MEG\pipeline\MEG_pipeline_elekta\\MEG_path.txt');
% MEG_file = importdata('D:\MEG\pipeline\MEG_pipeline_elekta\\MEG_file.txt');
% MRI_dataset = importdata('D:\MEG\pipeline\MEG_pipeline_elekta\\MRI_path.txt');
MEG_dataset  = '/media/jianfeng/data/MEG/pku_data/data/151116/';
MEG_file = 'vef_gabor_counting_HL_sss.fif';
MRI_dataset  = '/media/jianfeng/data/MEG/pku_data/data/003_Sag_3D_T1BRAVO';

trigger_value =61450;

addpath('/media/jianfeng/data/MEG/pipeline/MEG_pipeline_elekta');

% for MEG_num = 1:length(MEG_dataset)
    cd(MEG_dataset);
    
%     header = ft_read_header(MEG_dataset{MEG_num});
%     header.orig.infods(5)
    
    
    mkdir('figure');
    s1_preprocessing_elekta;
    s2_ERF_elekta;
    s3_1_multiplotER_elekta;
    s3_2_databrowser_elekta;
    s3_3_topoplotER_elekta;
%     s4_forward_model_elekta;
%     s5_inverse_model_elekta;
% end