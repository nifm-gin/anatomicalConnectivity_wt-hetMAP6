% Connectivity matrix analysis - Structural connectome


%% Test for 3 WT mice - Option -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 1;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230517_025205_MRtrix-output_studyWt-MAP6Mice/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230517_025205_MRtrix-output_studyWt-MAP6Mice/Mouse-2/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230517_025205_MRtrix-output_studyWt-MAP6Mice/Mouse-3/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    ];

arrayTitles = [...
    "M672 - cutoff: 0.30";...
    "M872 - cutoff: 0.28";...
    "M8876 - cutoff: 0.28";...
];

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

minScaleBar = 0;
maxScaleBar = 15000;

%% Test for 3 WT mice - Option -scale_invnodevol -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 1;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230517_025205_MRtrix-output_studyWt-MAP6Mice/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230517_025205_MRtrix-output_studyWt-MAP6Mice/Mouse-2/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230517_025205_MRtrix-output_studyWt-MAP6Mice/Mouse-3/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    ];

arrayTitles = [...
    "M672 - cutoff: 0.30 - scale inv. vol";...
    "M872 - cutoff: 0.28 - scale inv. vol";...
    "M8876 - cutoff: 0.28 - scale inv. vol";...
];

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

minScaleBar = 0;
maxScaleBar = 0.8;



%% 6 WT and 6 MAP6 +/- mice - Option -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 0;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    ];

% arrayTitles = [...
%     "M672 - cutoff: 0.30";...
%     "M872 - cutoff: 0.28";...
%     "M874 - cutoff: 0.30";...
%     "M875 - cutoff: 0.29";...
%     "M886 - cutoff: 0.30";...
%     "M8876 - cutoff: 0.28";...
%     "M757 - cutoff: 0.29";...
%     "M857 - cutoff: 0.28";...
%     "M866 - cutoff: 0.28";...
%     "M867bis - cutoff: 0.29";...
%     "M877 - cutoff: 0.29";...
%     "M881bis - cutoff: 0.29";...
% ];

arrayTitles = [...
    "M672";...
    "M872";...
    "M874";...
    "M875";...
    "M886";...
    "M8876";...
    "M757";...
    "M857";...
    "M866";...
    "M867bis";...
    "M877";...
    "M881bis";...
];

suffixTitle = "Raw DWI - zero transform";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

nWTMice = 6;
nMAP6Mice = 6;

minScaleBar = 0;
maxScaleBar = 20000;

saveFigures = 1;
regValue = 1e-1;

analyzeReducedMatrix = 1;
posToErasePathStr = 9; % Last subject ("/Mouse-12")

%% 6 WT and 6 MAP6 +/- mice - Option -scale_invnodevol -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 0;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";..."/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    ];

% arrayTitles = [...
%     "M672 - cutoff: 0.30";...
%     "M872 - cutoff: 0.28";...
%     "M874 - cutoff: 0.30";...
%     "M875 - cutoff: 0.29";...
%     "M886 - cutoff: 0.30";...
%     "M8876 - cutoff: 0.28";...
%     "M757 - cutoff: 0.29";...
%     "M857 - cutoff: 0.28";...
%     "M866 - cutoff: 0.28";...
%     "M867bis - cutoff: 0.29";...
%     "M877 - cutoff: 0.29";...
%     "M881bis - cutoff: 0.29";...
% ];

arrayTitles = [...
    "M672";...
    "M872";...
    "M874";...
    "M875";...
    "M886";...
    "M8876";...
    "M757";...
    "M857";...
    "M866";...
    "M867bis";...
    "M877";...
    "M881bis";...
];

suffixTitle = "Raw DWI - zero transform";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

nWTMice = 6;
nMAP6Mice = 6;

minScaleBar = 0;
maxScaleBar = 1;

saveFigures = 0;
regValue = 1e-1;

analyzeReducedMatrix = 1;
posToErasePathStr = 9; % Last subject ("/Mouse-12")


nLinesSubPlots = 2;

%% 1 WT mouse with different cutoffs - Option -scale_invnodevol -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 0;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2600_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2700_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";..."/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3100_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3200_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/connectome_tracks_3_cutoff-0.2600_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    ];

arrayTitles = [...
    "M672 - cutoff: 0.26";...
    "M672 - cutoff: 0.27";...
    "M672 - cutoff: 0.28";...
    "M672 - cutoff: 0.29";...
    "M672 - cutoff: 0.30";...
    "M672 - cutoff: 0.31";...
    "M672 - cutoff: 0.32";...
    "MXXX - cutoff: 0.XXX";...
];

suffixTitle = "Raw DWI - zero transform";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

nWTMice = 7;
nMAP6Mice = 1;

minScaleBar = 0;
maxScaleBar = 1;

saveFigures = 0;
regValue = 1e-1;

analyzeReducedMatrix = 1;
posToErasePathStr = 9; % Last subject ("/Mouse-12")

nLinesSubPlots = 3;


%% 1 WT mouse with different cutoffs - Option -scale_invnodevol -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 0;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2600_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2700_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";..."/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3100_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3200_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/connectome_tracks_3_cutoff-0.2600_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    ];

arrayTitles = [...
    "M672 - cutoff: 0.26";...
    "M672 - cutoff: 0.27";...
    "M672 - cutoff: 0.28";...
    "M672 - cutoff: 0.29";...
    "M672 - cutoff: 0.30";...
    "M672 - cutoff: 0.31";...
    "M672 - cutoff: 0.32";...
    "MXXX - cutoff: 0.XXX";...
];

suffixTitle = "Raw DWI - zero transform";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

nWTMice = 7;
nMAP6Mice = 1;

minScaleBar = 0;
maxScaleBar = 22000;

saveFigures = 0;
regValue = 1e-1;

analyzeReducedMatrix = 1;
analyzeSymmetryWT = 1;
analyzeSymmetryMAP6 = 1;

posToErasePathStr = 9; % Last subject ("/Mouse-12")

nLinesSubPlots = 3;



%% Symmetry analysis - 6 WT and 6 MAP6 +/- mice - Option -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 0;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal.csv";...
    ];

% arrayTitles = [...
%     "M672 - cutoff: 0.30";...
%     "M872 - cutoff: 0.28";...
%     "M874 - cutoff: 0.30";...
%     "M875 - cutoff: 0.29";...
%     "M886 - cutoff: 0.30";...
%     "M8876 - cutoff: 0.28";...
%     "M757 - cutoff: 0.29";...
%     "M857 - cutoff: 0.28";...
%     "M866 - cutoff: 0.28";...
%     "M867bis - cutoff: 0.29";...
%     "M877 - cutoff: 0.29";...
%     "M881bis - cutoff: 0.29";...
% ];

arrayTitles = [...
    "M672";...
    "M872";...
    "M874";...
    "M875";...
    "M886";...
    "M8876";...
    "M757";...
    "M857";...
    "M866";...
    "M867bis";...
    "M877";...
    "M881bis";...
];

suffixTitle = "Raw DWI - zero transform";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

nWTMice = 6;
nMAP6Mice = 6;

minScaleBar = 0;
maxScaleBar = 20000;

saveFigures = 1;
regValue = 1e-1;

analyzeReducedMatrix = 1;
analyzeSymmetryWT = 0;
analyzeSymmetryMAP6 = 1;

posToErasePathStr = 9; % Last subject ("/Mouse-12")

nLinesSubPlots = 2;


%% Symmetry analysis - 6 WT and 6 MAP6 +/- mice - Option -scale_invnodevol -zero_diagonal and -symmetric
close all
clear
clc

posReduced = 25;
firstPosNull = 0;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";..."/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/connectome_tracks_3_cutoff-0.3000_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/connectome_tracks_3_cutoff-0.2800_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/connectome_tracks_3_cutoff-0.2900_minl-0.1_maxl-50_step-0.01_angle-8.1921_symmetric-zeroDiagonal-scaleInvnodevol.csv";...
    ];

% arrayTitles = [...
%     "M672 - cutoff: 0.30";...
%     "M872 - cutoff: 0.28";...
%     "M874 - cutoff: 0.30";...
%     "M875 - cutoff: 0.29";...
%     "M886 - cutoff: 0.30";...
%     "M8876 - cutoff: 0.28";...
%     "M757 - cutoff: 0.29";...
%     "M857 - cutoff: 0.28";...
%     "M866 - cutoff: 0.28";...
%     "M867bis - cutoff: 0.29";...
%     "M877 - cutoff: 0.29";...
%     "M881bis - cutoff: 0.29";...
% ];

arrayTitles = [...
    "M672";...
    "M872";...
    "M874";...
    "M875";...
    "M886";...
    "M8876";...
    "M757";...
    "M857";...
    "M866";...
    "M867bis";...
    "M877";...
    "M881bis";...
];

suffixTitle = "Raw DWI - zero transform";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];

nWTMice = 6;
nMAP6Mice = 6;

minScaleBar = 0;
maxScaleBar = 1;

saveFigures = 1;
regValue = 1e-1;

analyzeReducedMatrix = 1;
analyzeSymmetryWT = 0;
analyzeSymmetryMAP6 = 1;

posToErasePathStr = 9; % Last subject ("/Mouse-12")

nLinesSubPlots = 2;

%%

ticksArray = [1:1:posReduced*2];
ticksLabels = strrep(labels,'_', '\_');
ticksFontSize = 5;

corrMatrixWTReduced = zeros(posReduced*2,posReduced*2,nWTMice);
corrMatrixMAP6Reduced = zeros(posReduced*2,posReduced*2,nMAP6Mice);

for index=1:nWTMice

    corrMatrixWTTemp(:,:,index) = csvread(pathConnectomeArray(index)) + regValue;
    [filepath, name, ext] = fileparts(pathConnectomeArray(index))

    if (firstPosNull)
        corrMatrixWT(:,:,index) = corrMatrixWTTemp(2:end,2:end,index);   
    else
        corrMatrixWT(:,:,index) = corrMatrixWTTemp(:,:,index);   
    end

%corrMatrixWTReduced(1:posReduced,1:posReduced,index) = corrMatrixWT((1+firstPosNull):(posReduced+firstPosNull),(1+firstPosNull):(posReduced+firstPosNull),index);
%corrMatrixWTReduced(posReduced+1:end,posReduced+1:end,index) = corrMatrixWT(((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull):((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull + posReduced - 1),((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull):((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull + posReduced - 1),index);

    corrMatrixWTReduced(1:posReduced,1:posReduced,index) = corrMatrixWT((1):(posReduced),(1):(posReduced),index);
    corrMatrixWTReduced(posReduced+1:end,posReduced+1:end,index) = corrMatrixWT(((size(corrMatrixWT,1))/2 + 1 ):((size(corrMatrixWT,1))/2 + 1 + posReduced - 1 ),((size(corrMatrixWT,1) )/2 + 1 ):((size(corrMatrixWT,1) )/2 + 1 + posReduced - 1 ),index);
    
    corrMatrixWTReduced(1:posReduced,posReduced+1:end,index) = corrMatrixWT((1):(posReduced),((size(corrMatrixWT,1) )/2 + 1 ):((size(corrMatrixWT,1) )/2 + 1 + posReduced - 1 ),index);
    corrMatrixWTReduced(posReduced+1:end,1:posReduced,index) = corrMatrixWT(((size(corrMatrixWT,1))/2 + 1 ):((size(corrMatrixWT,1))/2 + 1 + posReduced - 1 ),(1):(posReduced),index);
end


for index=1:nMAP6Mice

    corrMatrixMAP6Temp(:,:,index) = csvread(pathConnectomeArray(index+nMAP6Mice)) + regValue;
    [filepath, name, ext] = fileparts(pathConnectomeArray(index+nMAP6Mice))

    if (firstPosNull)
        corrMatrixMAP6(:,:,index) = corrMatrixMAP6Temp(2:end,2:end,index);   
    else
        corrMatrixMAP6(:,:,index) = corrMatrixMAP6Temp(:,:,index);   
    end

    corrMatrixMAP6Reduced(1:posReduced,1:posReduced,index) = corrMatrixMAP6((1):(posReduced),(1):(posReduced),index);
    corrMatrixMAP6Reduced(posReduced+1:end,posReduced+1:end,index) = corrMatrixMAP6(((size(corrMatrixMAP6,1) )/2 + 1 ):((size(corrMatrixMAP6,1) )/2 + 1  + posReduced - 1),((size(corrMatrixMAP6,1) )/2 + 1 ):((size(corrMatrixMAP6,1) )/2 + 1  + posReduced - 1),index);

    corrMatrixMAP6Reduced(1:posReduced,posReduced+1:end,index) = corrMatrixMAP6((1):(posReduced),((size(corrMatrixMAP6,1) )/2 + 1 ):((size(corrMatrixMAP6,1) )/2 + 1  + posReduced - 1),index);
    corrMatrixMAP6Reduced(posReduced+1:end,1:posReduced,index) = corrMatrixMAP6(((size(corrMatrixMAP6,1) )/2 + 1 ):((size(corrMatrixMAP6,1) )/2 + 1  + posReduced - 1),(1):(posReduced),index);
end


if (analyzeReducedMatrix)
    corrMatrixWTForComp = corrMatrixWTReduced;
    corrMatrixMAP6ForComp = corrMatrixMAP6Reduced;
else
    corrMatrixWTForComp = corrMatrixWT;
    corrMatrixMAP6ForComp = corrMatrixMAP6;
end




figure('units','normalized','outerposition',[0 0 1 1]);
for index=1:nWTMice
subplot(nLinesSubPlots,3,index)
imshow(squeeze(corrMatrixWTForComp(:,:,index)-regValue),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([minScaleBar maxScaleBar])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(arrayTitles(index),'FontSize',12)
end

connetomePathFolder = convertStringsToChars( filepath );
connetomePathFolder = connetomePathFolder(1:end-posToErasePathStr)

connetomeOptions = convertStringsToChars( name );
connetomeOptions = connetomeOptions(75:end)

sgtitle(strcat("Structural connectomes of WT mice - 50 labels - ",connetomeOptions))



if saveFigures
    saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_',connetomeOptions,'.fig'))    
    exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_',connetomeOptions,'.png'),'Resolution',600) 
end


figure('units','normalized','outerposition',[0 0 1 1]);
for index=1:nMAP6Mice
subplot(nLinesSubPlots,3,index)
imshow(squeeze(corrMatrixMAP6ForComp(:,:,index)-regValue),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([minScaleBar maxScaleBar])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(arrayTitles(index+nWTMice),'FontSize',12)
end
sgtitle(strcat("Structural connectomes of MAP6^{+/-} mice - 50 labels - ",connetomeOptions))

if saveFigures
    saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_',connetomeOptions,'.fig'))
    exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_',connetomeOptions,'.png'),'Resolution',600)       
end


%
ticksFontSize = 3;
corrMatrixWTMean = mean(corrMatrixWTForComp,3);
corrMatrixWTMedian = median(corrMatrixWTForComp,3);
[corrMatrixWTMin, corrMatrixWTMinPos] = min(corrMatrixWTForComp,[],3);
[corrMatrixWTMax, corrMatrixWTMaxPos] = max(corrMatrixWTForComp,[],3);
[corrMatrixWTStd] = std(corrMatrixWTForComp,0,3);

corrMatrixWTMinMax = max(corrMatrixWTMin(:));
corrMatrixWTMaxMax = max(corrMatrixWTMax(:));
corrMatrixWTStdMax = max(corrMatrixWTStd(:));


    corrMatrixMAP6Mean = mean(corrMatrixMAP6ForComp,3);
    corrMatrixMAP6Median = median(corrMatrixMAP6ForComp,3);
    [corrMatrixMAP6Min, corrMatrixMAP6MinPos] = min(corrMatrixMAP6ForComp,[],3);
    [corrMatrixMAP6Max, corrMatrixMAP6MaxPos] = max(corrMatrixMAP6ForComp,[],3);
    corrMatrixMAP6Std = std(corrMatrixMAP6ForComp,0,3);
    
    corrMatrixMAP6MinMax = max(corrMatrixMAP6Min(:));
    corrMatrixMAP6MaxMax = max(corrMatrixMAP6Max(:));
    corrMatrixMAP6StdMax = max(corrMatrixMAP6Std(:));
    
    corrMatrixGlobalMinMax = max([corrMatrixWTMinMax corrMatrixMAP6MinMax]);
    corrMatrixGlobalMaxMax = max([corrMatrixWTMaxMax corrMatrixMAP6MaxMax]);
    corrMatrixGlobalStdMax = max([corrMatrixWTStdMax corrMatrixMAP6StdMax]);

    corrMatrixMeanDiff = corrMatrixMAP6Mean - corrMatrixWTMean;
    corrMatrixMeanDiffPerc = (corrMatrixMAP6Mean - corrMatrixWTMean)./corrMatrixWTMean*100;

    corrMatrixPValue = zeros(size(corrMatrixWTForComp,1),size(corrMatrixWTForComp,2));
    for indexLine=1:size(corrMatrixWTForComp,1)
        for indexCol=1:size(corrMatrixWTForComp,2)

            [h,p] = ttest2(squeeze(corrMatrixWTForComp(indexLine,indexCol,:)),squeeze(corrMatrixMAP6ForComp(indexLine,indexCol,:)));
            corrMatrixPValue(indexLine,indexCol) = p;

        end
    end
    
    corrMatrixWTVar = var(corrMatrixWTForComp,0,3);
    corrMatrixMAP6Var = var(corrMatrixMAP6ForComp,0,3);
    
    corrMatrixWTVarMean = mean(corrMatrixWTVar(:));
    corrMatrixMAP6VarMean = mean(corrMatrixMAP6Var(:));
    
    %corrMatrixWTVarMeanAcrossSubjects(indexFolder) = corrMatrixWTVarMean;
    %corrMatrixMAP6VarMeanAcrossSubjects(indexFolder) = corrMatrixMAP6VarMean;
    
    corrMatrixWTVarMeanAcrossSubjects = corrMatrixWTVarMean;
    corrMatrixMAP6VarMeanAcrossSubjects = corrMatrixMAP6VarMean;

    
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,3,1)
    imshow(corrMatrixWTMean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Mean connectivity matrix","WT mice",suffixTitle],'FontSize',12)

    subplot(3,3,2)
    imshow(corrMatrixMAP6Mean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Mean connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12)


    subplot(3,3,4)
    imshow(corrMatrixMeanDiff,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Difference mean conn. matrix","MAP6^{+/-} - WT mice"],'FontSize',12)

    subplot(3,3,5)
    imshow(corrMatrixMeanDiffPerc,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([-100 100])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Difference mean conn. matrix [%]","MAP6^{+/-} - WT mice"],'FontSize',12)

    subplot(3,3,6)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["p-value matrix","MAP6^{+/-} vs WT mice"],'FontSize',12)

    subplot(3,3,7)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.05])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["p-value matrix (lim. p=0.05)","MAP6^{+/-} vs WT mice"],'FontSize',12)

    subplot(3,3,8)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.01])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["p-value matrix (lim. p=0.01)","MAP6^{+/-} vs WT mice"],'FontSize',12)

    subplot(3,3,9)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.001])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["p-value matrix (lim. p=0.001)","MAP6^{+/-} vs WT mice"],'FontSize',12)
  
    %sgtitle([strrep(strcat(name,ext), '_', '\_'),"","Summary of the main results",strcat("Mean variance of the connec. matrices across subjects - WT group: ",num2str(corrMatrixWTVarMean),", MAP6^{+/-} group: ",num2str(corrMatrixMAP6VarMean)),""])
    sgtitle([strcat("Structural connectomes - 50 labels - ",connetomeOptions),"Summary of the main results",strcat("Mean variance of the connec. matrices across subjects - WT group: ",num2str(corrMatrixWTVarMean),", MAP6^{+/-} group: ",num2str(corrMatrixMAP6VarMean)),""])
    pause(2)
    
    
    
    if saveFigures
        saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtVshetMAP6Mice_',connetomeOptions,'.fig'))
        exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtVshetMAP6Mice_',connetomeOptions,'.png'),'Resolution',600)
    
        save(strcat(connetomePathFolder,'/structuralConnectomeCompilation_matlabWorkspace_',connetomeOptions,'.mat'))
    end
    
 %%   
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,3,1)
    imshow(corrMatrixWTMin-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar corrMatrixGlobalMinMax])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Min connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,2)
    imshow(corrMatrixWTMax-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar corrMatrixGlobalMaxMax])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Max connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,3)
    imshow(corrMatrixWTStd,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar corrMatrixGlobalStdMax])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Std connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,4)
    imshow(corrMatrixWTMean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Mean connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,5)
    imshow(corrMatrixWTMedian-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Median connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,7)
    imshow(corrMatrixWTMinPos,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    %caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Subject - Min connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,8)
    imshow(corrMatrixWTMaxPos,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    %caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Subject - Max connectivity matrix","WT mice",suffixTitle],'FontSize',12) 
    
    sgtitle("Value dispersion of the connectivity matrices - WT mice"); 
    pause(2)
    
       
    if saveFigures
        saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_valueDispersionConnMat_',connetomeOptions,'.fig'))
        exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_valueDispersionConnMat_',connetomeOptions,'.png'),'Resolution',600)
    end
    
    
    
    
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,3,1)
    imshow(corrMatrixMAP6Min-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar corrMatrixGlobalMinMax])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Min connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,2)
    imshow(corrMatrixMAP6Max-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar corrMatrixGlobalMaxMax])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Max connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,3)
    imshow(corrMatrixMAP6Std,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar corrMatrixGlobalStdMax])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Std connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,4)
    imshow(corrMatrixMAP6Mean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Mean connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,5)
    imshow(corrMatrixMAP6Median-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Median connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,7)
    imshow(corrMatrixMAP6MinPos,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    %caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Subject - Min connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    subplot(3,3,8)
    imshow(corrMatrixMAP6MaxPos,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    %caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Subject - Max connectivity matrix","MAP6^{+/-} mice",suffixTitle],'FontSize',12) 
    
    sgtitle("Value dispersion of the connectivity matrices - MAP6^{+/-} mice"); 
    pause(2)
    
       
    if saveFigures
        saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_valueDispersionConnMat_',connetomeOptions,'.fig'))
        exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_valueDispersionConnMat_',connetomeOptions,'.png'),'Resolution',600)
    end
 %%   

    
    
 
% Analyze symmetry for WT mice ----------------------------------------------------------------------    
close all


if (analyzeSymmetryWT)
    
    ticksFontSize = ticksFontSize*3;

    corrMatrixWTForComp =   corrMatrixWTReduced(1:posReduced,1:posReduced,:);
    corrMatrixMAP6ForComp = corrMatrixWTReduced(posReduced+1:end,posReduced+1:end,:);
    
    

figure('units','normalized','outerposition',[0 0 1 1]);
for index=1:nWTMice
subplot(nLinesSubPlots,3,index)
imshow(squeeze(corrMatrixWTForComp(:,:,index)-regValue),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([minScaleBar maxScaleBar])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(arrayTitles(index),'FontSize',12)
end

connetomePathFolder = convertStringsToChars( filepath );
connetomePathFolder = connetomePathFolder(1:end-posToErasePathStr)

connetomeOptions = convertStringsToChars( name );
connetomeOptions = connetomeOptions(75:end)

sgtitle(strcat("Symmetry analysis WT mice - Structural connectomes of the right side - 50 labels - ",connetomeOptions))



if saveFigures
    saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_rightSide_symmetryAnalysis_',connetomeOptions,'.fig'))    
    exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_rightSide_symmetryAnalysis_',connetomeOptions,'.png'),'Resolution',600) 
end


figure('units','normalized','outerposition',[0 0 1 1]);
for index=1:nMAP6Mice
subplot(nLinesSubPlots,3,index)
imshow(squeeze(corrMatrixMAP6ForComp(:,:,index)-regValue),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([minScaleBar maxScaleBar])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
title(arrayTitles(index+nWTMice),'FontSize',12)
end
sgtitle(strcat("Symmetry analysis WT mice - Structural connectomes of the left side - 50 labels - ",connetomeOptions))

if saveFigures
    saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_leftSide_symmetryAnalysis_',connetomeOptions,'.fig'))
    exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_leftSide_symmetryAnalysis_',connetomeOptions,'.png'),'Resolution',600)       
end


%
ticksFontSize = 6;
corrMatrixWTMean = mean(corrMatrixWTForComp,3);
    corrMatrixMAP6Mean = mean(corrMatrixMAP6ForComp,3);

    corrMatrixMeanDiff = corrMatrixMAP6Mean - corrMatrixWTMean;
    corrMatrixMeanDiffPerc = (corrMatrixMAP6Mean - corrMatrixWTMean)./corrMatrixWTMean*100;

    corrMatrixPValue = zeros(size(corrMatrixWTForComp,1),size(corrMatrixWTForComp,2));
    for indexLine=1:size(corrMatrixWTForComp,1)
        for indexCol=1:size(corrMatrixWTForComp,2)

            [h,p] = ttest2(squeeze(corrMatrixWTForComp(indexLine,indexCol,:)),squeeze(corrMatrixMAP6ForComp(indexLine,indexCol,:)));
            corrMatrixPValue(indexLine,indexCol) = p;

        end
    end
    
    corrMatrixWTVar = var(corrMatrixWTForComp,0,3);
    corrMatrixMAP6Var = var(corrMatrixMAP6ForComp,0,3);
    
    corrMatrixWTVarMean = mean(corrMatrixWTVar(:));
    corrMatrixMAP6VarMean = mean(corrMatrixMAP6Var(:));
    
    %corrMatrixWTVarMeanAcrossSubjects(indexFolder) = corrMatrixWTVarMean;
    %corrMatrixMAP6VarMeanAcrossSubjects(indexFolder) = corrMatrixMAP6VarMean;
    
    corrMatrixWTVarMeanAcrossSubjects = corrMatrixWTVarMean;
    corrMatrixMAP6VarMeanAcrossSubjects = corrMatrixMAP6VarMean;

    
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,3,1)
    imshow(corrMatrixWTMean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - Mean connectivity matrix","Right side",suffixTitle],'FontSize',12)

    subplot(3,3,2)
    imshow(corrMatrixMAP6Mean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
    title(["Symmetry analysis - Mean connectivity matrix","Left side",suffixTitle],'FontSize',12)


    subplot(3,3,4)
    imshow(corrMatrixMeanDiff,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - Difference mean conn. matrix","Left side - Right side"],'FontSize',12)

    subplot(3,3,5)
    imshow(corrMatrixMeanDiffPerc,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([-100 100])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - Difference mean conn. matrix [%]","Left side - Right side"],'FontSize',12)

    subplot(3,3,6)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix","Left side vs Right side"],'FontSize',12)

    subplot(3,3,7)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.05])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix (lim. p=0.05)","Left side vs Right side"],'FontSize',12)

    subplot(3,3,8)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.01])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix (lim. p=0.01)","Left side vs Right side"],'FontSize',12)

    subplot(3,3,9)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.001])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix (lim. p=0.001)","Left side vs Right side"],'FontSize',12)
  
    %sgtitle([strrep(strcat(name,ext), '_', '\_'),"","Summary of the main results",strcat("Mean variance of the connec. matrices across subjects - WT group: ",num2str(corrMatrixWTVarMean),", MAP6^{+/-} group: ",num2str(corrMatrixMAP6VarMean)),""])
    sgtitle([strcat("Symmetry analysis WT mice - Structural connectomes - 50 labels - ",connetomeOptions),"Summary of the main results",strcat("Mean variance of the connec. matrices across subjects - Right side: ",num2str(corrMatrixWTVarMean),", Left side: ",num2str(corrMatrixMAP6VarMean)),""])
    pause(2)
    
    
    
    if saveFigures
        saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_rightVsLeftSide_symmetryAnalysis_',connetomeOptions,'.fig'))
        exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_wtMice_rightVsLeftSide_symmetryAnalysis_',connetomeOptions,'.png'),'Resolution',600)
    
        save(strcat(connetomePathFolder,'/structuralConnectomeCompilation_matlabWorkspace_wtMice_rightVsLeftSide_symmetryAnalysis_',connetomeOptions,'.mat'))
    end
    
    
end
% --------------------------------------------------------------------------------------------------








% Analyze symmetry for MAP6 mice ----------------------------------------------------------------------    
close all


if (analyzeSymmetryMAP6)
    
    ticksFontSize = ticksFontSize*3;

    corrMatrixWTForComp =   corrMatrixMAP6Reduced(1:posReduced,1:posReduced,:);
    corrMatrixMAP6ForComp = corrMatrixMAP6Reduced(posReduced+1:end,posReduced+1:end,:);
    
    

figure('units','normalized','outerposition',[0 0 1 1]);
for index=1:nWTMice
subplot(nLinesSubPlots,3,index)
imshow(squeeze(corrMatrixWTForComp(:,:,index)-regValue),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([minScaleBar maxScaleBar])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(arrayTitles(index),'FontSize',12)
end

connetomePathFolder = convertStringsToChars( filepath );
connetomePathFolder = connetomePathFolder(1:end-posToErasePathStr)

connetomeOptions = convertStringsToChars( name );
connetomeOptions = connetomeOptions(75:end)

sgtitle(strcat("Symmetry analysis MAP6^{+/-} mice - Structural connectomes of the right side - 50 labels - ",connetomeOptions))



if saveFigures
    saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_rightSide_symmetryAnalysis_',connetomeOptions,'.fig'))    
    exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_rightSide_symmetryAnalysis_',connetomeOptions,'.png'),'Resolution',600) 
end


figure('units','normalized','outerposition',[0 0 1 1]);
for index=1:nMAP6Mice
subplot(nLinesSubPlots,3,index)
imshow(squeeze(corrMatrixMAP6ForComp(:,:,index)-regValue),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([minScaleBar maxScaleBar])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
title(arrayTitles(index+nWTMice),'FontSize',12)
end
sgtitle(strcat("Symmetry analysis MAP6^{+/-} mice - Structural connectomes of the left side - 50 labels - ",connetomeOptions))

if saveFigures
    saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_leftSide_symmetryAnalysis_',connetomeOptions,'.fig'))
    exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_leftSide_symmetryAnalysis_',connetomeOptions,'.png'),'Resolution',600)       
end


%
ticksFontSize = 6;
corrMatrixWTMean = mean(corrMatrixWTForComp,3);
    corrMatrixMAP6Mean = mean(corrMatrixMAP6ForComp,3);

    corrMatrixMeanDiff = corrMatrixMAP6Mean - corrMatrixWTMean;
    corrMatrixMeanDiffPerc = (corrMatrixMAP6Mean - corrMatrixWTMean)./corrMatrixWTMean*100;

    corrMatrixPValue = zeros(size(corrMatrixWTForComp,1),size(corrMatrixWTForComp,2));
    for indexLine=1:size(corrMatrixWTForComp,1)
        for indexCol=1:size(corrMatrixWTForComp,2)

            [h,p] = ttest2(squeeze(corrMatrixWTForComp(indexLine,indexCol,:)),squeeze(corrMatrixMAP6ForComp(indexLine,indexCol,:)));
            corrMatrixPValue(indexLine,indexCol) = p;

        end
    end
    
    corrMatrixWTVar = var(corrMatrixWTForComp,0,3);
    corrMatrixMAP6Var = var(corrMatrixMAP6ForComp,0,3);
    
    corrMatrixWTVarMean = mean(corrMatrixWTVar(:));
    corrMatrixMAP6VarMean = mean(corrMatrixMAP6Var(:));
    
    %corrMatrixWTVarMeanAcrossSubjects(indexFolder) = corrMatrixWTVarMean;
    %corrMatrixMAP6VarMeanAcrossSubjects(indexFolder) = corrMatrixMAP6VarMean;
    
    corrMatrixWTVarMeanAcrossSubjects = corrMatrixWTVarMean;
    corrMatrixMAP6VarMeanAcrossSubjects = corrMatrixMAP6VarMean;

    
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,3,1)
    imshow(corrMatrixWTMean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - Mean connectivity matrix","Right side",suffixTitle],'FontSize',12)

    subplot(3,3,2)
    imshow(corrMatrixMAP6Mean-regValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([minScaleBar maxScaleBar])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels(1,size(ticksLabels,2)/2+1:end))
    title(["Symmetry analysis - Mean connectivity matrix","Left side",suffixTitle],'FontSize',12)


    subplot(3,3,4)
    imshow(corrMatrixMeanDiff,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - Difference mean conn. matrix","Left side - Right side"],'FontSize',12)

    subplot(3,3,5)
    imshow(corrMatrixMeanDiffPerc,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([-100 100])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - Difference mean conn. matrix [%]","Left side - Right side"],'FontSize',12)

    subplot(3,3,6)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix","Left side vs Right side"],'FontSize',12)

    subplot(3,3,7)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.05])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix (lim. p=0.05)","Left side vs Right side"],'FontSize',12)

    subplot(3,3,8)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.01])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix (lim. p=0.01)","Left side vs Right side"],'FontSize',12)

    subplot(3,3,9)
    imshow(corrMatrixPValue,[])
    colormap 'jet'
    c = colorbar;
    c.FontSize = 10;
    caxis([0 0.001])
    axis on
    ax = gca;
    ax.FontSize = ticksFontSize; 
    xticks(ticksArray)
    xticklabels(ticksLabels)
    xtickangle(90)
    yticks(ticksArray)
    yticklabels(ticksLabels)
    title(["Symmetry analysis - p-value matrix (lim. p=0.001)","Left side vs Right side"],'FontSize',12)
  
    %sgtitle([strrep(strcat(name,ext), '_', '\_'),"","Summary of the main results",strcat("Mean variance of the connec. matrices across subjects - WT group: ",num2str(corrMatrixWTVarMean),", MAP6^{+/-} group: ",num2str(corrMatrixMAP6VarMean)),""])
    sgtitle([strcat("Symmetry analysis MAP6^{+/-} mice - Structural connectomes - 50 labels - ",connetomeOptions),"Summary of the main results",strcat("Mean variance of the connec. matrices across subjects - Right side: ",num2str(corrMatrixWTVarMean),", Left side: ",num2str(corrMatrixMAP6VarMean)),""])
    pause(2)
    
    
    
    if saveFigures
        saveas(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_rightVsLeftSide_symmetryAnalysis_',connetomeOptions,'.fig'))
        exportgraphics(gcf,strcat(connetomePathFolder,'/structuralConnectomeCompilation_hetMAP6Mice_rightVsLeftSide_symmetryAnalysis_',connetomeOptions,'.png'),'Resolution',600)
    
        save(strcat(connetomePathFolder,'/structuralConnectomeCompilation_matlabWorkspace_hetMAP6Mice_rightVsLeftSide_symmetryAnalysis_',connetomeOptions,'.mat'))
    end
    
    
end
% ------------------------------------------------
%%

%atlasTest = niftiread("/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/registeredAtlas_continuousLabels.nii");
%idxArray = zeros(227,1);

%for idxVer=1:227
%[idxTest] = find(atlasTest==idxVer);
%idxArray(idxVer) = sum(idxTest(:));
%end

