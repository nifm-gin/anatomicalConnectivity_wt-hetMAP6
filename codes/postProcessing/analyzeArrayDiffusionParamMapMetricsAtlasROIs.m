% Process array of diffusion parametric map metrics within ROIs

close all
clear
clc

pathSubjectsFAMapArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/diffusionParametricMapMetricsWithinROIAtlas_medianValue_FA_map_registeredAtlas_continuousLabels.csv",...
];

pathSubjectsMDMapArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/diffusionParametricMapMetricsWithinROIAtlas_medianValue_ADC_map_registeredAtlas_continuousLabels.csv",...
];

pathSaveData = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/diffusionParametricMapsAnalysis/";

posReduced = 25;
analysisTitle = "Average across subjects of the median FA and MD within registered atlas ROIs";

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];
labelsForSymAnalysis = ["FP","SMa","SSa","GVAa","Va","FC","TPEa","Oa","HP","PHr","OS","SD","SV","Sr","Aa","PL","TH","HT","CO","MB","SN","PO","ME","CVr","CHr"];

saveData = 0;
%%

ticksArray = [1:1:posReduced*2];
ticksLabels = strrep(labels,'_', '\_');
ticksFontSize = 8;


ticksArrayForSymAnalysis = [1:1:posReduced];
%ticksLabelsForSymAnalysis = strrep(labelsForSymAnalysis,'_', '\_');
ticksLabelsForSymAnalysis = labelsForSymAnalysis;
ticksFontSizeForSymAnalysis = 12;

nSubjects = size(pathSubjectsFAMapArray,2);
sizeArray = size(csvread(pathSubjectsFAMapArray(1)),2);

faMapMatrix = zeros(nSubjects,sizeArray);
mdMapMatrix = zeros(nSubjects,sizeArray);

faMapMatrixReducedWT = zeros(nSubjects/2,posReduced*2);
mdMapMatrixReducedWT = zeros(nSubjects/2,posReduced*2);

faMapMatrixReducedMAP6 = zeros(nSubjects/2,posReduced*2);
mdMapMatrixReducedMAP6 = zeros(nSubjects/2,posReduced*2);

faMapMatrixReducedWTMAP6PValue = zeros(1,posReduced*2);
mdMapMatrixReducedWTMAP6PValue = zeros(1,posReduced*2);

faMapMatrixReducedWTRightLeftPValue = zeros(1,posReduced);
faMapMatrixReducedMAP6RightLeftPValue = zeros(1,posReduced);

mdMapMatrixReducedWTRightLeftPValue = zeros(1,posReduced);
mdMapMatrixReducedMAP6RightLeftPValue = zeros(1,posReduced);

for index=1:size(pathSubjectsFAMapArray,2)
    
    faMapMatrix(index,:) = csvread(pathSubjectsFAMapArray(index));
    mdMapMatrix(index,:) = csvread(pathSubjectsMDMapArray(index));

end

faMapMatrixReducedWT(:,1:posReduced) = faMapMatrix(1:nSubjects/2,1:posReduced);
faMapMatrixReducedWT(:,(posReduced+1):end) = faMapMatrix(1:nSubjects/2,round(sizeArray/2 + 1 ):round(sizeArray/2 + 1 + posReduced - 1 ));

mdMapMatrixReducedWT(:,1:posReduced) = mdMapMatrix(1:nSubjects/2,1:posReduced);
mdMapMatrixReducedWT(:,(posReduced+1):end) = mdMapMatrix(1:nSubjects/2,round(sizeArray/2 + 1 ):round(sizeArray/2 + 1 + posReduced - 1 ));

faMapMatrixReducedMAP6(:,1:posReduced) = faMapMatrix(nSubjects/2+1:end,1:posReduced);
faMapMatrixReducedMAP6(:,(posReduced+1):end) = faMapMatrix(nSubjects/2+1:end,round(sizeArray/2 + 1 ):round(sizeArray/2 + 1 + posReduced - 1 ));

mdMapMatrixReducedMAP6(:,1:posReduced) = mdMapMatrix(nSubjects/2+1:end,1:posReduced);
mdMapMatrixReducedMAP6(:,(posReduced+1):end) = mdMapMatrix(nSubjects/2+1:end,round(sizeArray/2 + 1 ):round(sizeArray/2 + 1 + posReduced - 1 ));

for index=1:posReduced*2
    [h,p] = ttest2(squeeze(faMapMatrixReducedWT(:,index)),squeeze(faMapMatrixReducedMAP6(:,index)));
    faMapMatrixReducedWTMAP6PValue(index) = p;
    
    [h,p] = ttest2(squeeze(mdMapMatrixReducedWT(:,index)),squeeze(mdMapMatrixReducedMAP6(:,index)));
    mdMapMatrixReducedWTMAP6PValue(index) = p;
end

for index=1:posReduced
    [h,p] = ttest2(squeeze(faMapMatrixReducedWT(:,index)),squeeze(faMapMatrixReducedWT(:,posReduced+index)));
    faMapMatrixReducedWTRightLeftPValue(index) = p;
    
    [h,p] = ttest2(squeeze(mdMapMatrixReducedWT(:,index)),squeeze(mdMapMatrixReducedWT(:,posReduced+index)));
    mdMapMatrixReducedWTRightLeftPValue(index) = p;
    
    
    [h,p] = ttest2(squeeze(faMapMatrixReducedMAP6(:,index)),squeeze(faMapMatrixReducedMAP6(:,posReduced+index)));
    faMapMatrixReducedMAP6RightLeftPValue(index) = p;
    
    [h,p] = ttest2(squeeze(mdMapMatrixReducedMAP6(:,index)),squeeze(mdMapMatrixReducedMAP6(:,posReduced+index)));
    mdMapMatrixReducedMAP6RightLeftPValue(index) = p;
end


figure('units','normalized','outerposition',[0 0 1 1]);
subject = 1;

subplot(2,2,1)
plot(squeeze(faMapMatrix(subject,:)))

subplot(2,2,2)
plot(squeeze(mdMapMatrix(subject,:)))

subplot(2,2,3)
plot(ticksArray,squeeze(faMapMatrixReducedWT(subject,:)))

subplot(2,2,4)
plot(ticksArray,squeeze(mdMapMatrixReducedWT(subject,:)))

close all

figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
errorbar(squeeze(mean(faMapMatrixReducedWT,1)),squeeze(std(faMapMatrixReducedWT,1)),'b*')
hold on
errorbar(squeeze(mean(faMapMatrixReducedMAP6,1)),squeeze(std(faMapMatrixReducedMAP6,1)),'ro')

axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
%yticks(ticksArray)
%yticklabels(ticksLabels)
xlim([0 posReduced*2+1])
ylim([0 0.5])
xlabel("Atlas ROI",'FontSize',12)
ylabel("Average FA [a.u.]",'FontSize',12)
legend("WT group (n=6)","MAP6^{+/-} group (n=6)",'FontSize',10)
title("FA comparison",'FontSize',12)

subplot(2,2,2)
errorbar(squeeze(mean(mdMapMatrixReducedWT,1)),squeeze(std(mdMapMatrixReducedWT,1)),'b*')
hold on
errorbar(squeeze(mean(mdMapMatrixReducedMAP6,1)),squeeze(std(mdMapMatrixReducedMAP6,1)),'ro')

axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
%yticks(ticksArray)
%yticklabels(ticksLabels)
xlim([0 posReduced*2+1])
%ylim([0 1])
xlabel("Atlas ROI",'FontSize',12)
ylabel("Average MD [a.u.]",'FontSize',12)
legend("WT group (n=6)","MAP6^{+/-} group (n=6)",'FontSize',10)
title("MD comparison",'FontSize',12)

subplot(2,2,3)
plot(faMapMatrixReducedWTMAP6PValue,'g*')
xlim([0 posReduced*2+1])
ylim([0 0.05])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
xlabel("Atlas ROI",'FontSize',12)
ylabel("p-value [a.u.]",'FontSize',12)
title("P-value - FA comparison",'FontSize',12)

subplot(2,2,4)
plot(mdMapMatrixReducedWTMAP6PValue,'g*')
xlim([0 posReduced*2+1])
ylim([0 0.05])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
xlabel("Atlas ROI",'FontSize',12)
ylabel("p-value [a.u.]",'FontSize',12)
title("P-value - MD comparison",'FontSize',12)

sgtitle([analysisTitle,"WT vs MAP6^{+/-} mice",""],'FontSize',16)

if saveData
    saveas(gcf,strcat(pathSaveData,'faMDMapsComparison_wtVsMAP6.fig'))
    exportgraphics(gcf,strcat(pathSaveData,'faMDMapsComparison_wtVsMAP6.png'),'Resolution',600)
end


% Symetry analysis
% ------------------------------------------------------------------------------------------------



figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
errorbar(squeeze(mean(faMapMatrixReducedWT(:,1:posReduced),1)),squeeze(std(faMapMatrixReducedWT(:,1:posReduced),1)),'b*')
hold on
errorbar(squeeze(mean(faMapMatrixReducedWT(:,posReduced+1:end),1)),squeeze(std(faMapMatrixReducedWT(:,posReduced+1:end),1)),'ro')

axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
%yticks(ticksArray)
%yticklabels(ticksLabels)
xlim([0 posReduced+1])
ylim([0 0.5])
xlabel("Atlas ROI",'FontSize',14)
ylabel("Average FA [a.u.]",'FontSize',14)
legend("Right side (n=3)","Left side (n=3)",'FontSize',12)
title("FA comparison",'FontSize',14)

subplot(2,2,2)
errorbar(squeeze(mean(mdMapMatrixReducedWT(:,1:posReduced),1)),squeeze(std(mdMapMatrixReducedWT(:,1:posReduced),1)),'b*')
hold on
errorbar(squeeze(mean(mdMapMatrixReducedWT(:,posReduced+1:end),1)),squeeze(std(mdMapMatrixReducedWT(:,posReduced+1:end),1)),'ro')

axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
%yticks(ticksArray)
%yticklabels(ticksLabels)
xlim([0 posReduced+1])
%ylim([0 1])
xlabel("Atlas ROI",'FontSize',14)
ylabel("Average MD [a.u.]",'FontSize',14)
legend("Right side (n=3)","Left side (n=3)",'FontSize',12)
title("MD comparison",'FontSize',14)

subplot(2,2,3)
plot(faMapMatrixReducedWTRightLeftPValue,'g*')
xlim([0 posReduced+1])
ylim([0 0.05])
axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
xlabel("Atlas ROI",'FontSize',14)
ylabel("p-value [a.u.]",'FontSize',14)
title("P-value - FA comparison",'FontSize',14)

subplot(2,2,4)
plot(mdMapMatrixReducedWTRightLeftPValue,'g*')
xlim([0 posReduced+1])
ylim([0 0.05])
axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
xlabel("Atlas ROI",'FontSize',14)
ylabel("p-value [a.u.]",'FontSize',14)
title("P-value - MD comparison",'FontSize',14)

sgtitle([analysisTitle,"Symmetry analysis of WT mice",""],'FontSize',18)

if saveData
    saveas(gcf,strcat(pathSaveData,'faMDMapsComparison_symmetryAnalysis_wtMice.fig'))
    exportgraphics(gcf,strcat(pathSaveData,'faMDMapsComparison_symmetryAnalysis_wtMice.png'),'Resolution',600)
end



figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
errorbar(squeeze(mean(faMapMatrixReducedMAP6(:,1:posReduced),1)),squeeze(std(faMapMatrixReducedMAP6(:,1:posReduced),1)),'b*')
hold on
errorbar(squeeze(mean(faMapMatrixReducedMAP6(:,posReduced+1:end),1)),squeeze(std(faMapMatrixReducedMAP6(:,posReduced+1:end),1)),'ro')

axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
%yticks(ticksArray)
%yticklabels(ticksLabels)
xlim([0 posReduced+1])
ylim([0 0.5])
xlabel("Atlas ROI",'FontSize',14)
ylabel("Average FA [a.u.]",'FontSize',14)
legend("Right side (n=3)","Left side (n=3)",'FontSize',12)
title("FA comparison",'FontSize',14)

subplot(2,2,2)
errorbar(squeeze(mean(mdMapMatrixReducedMAP6(:,1:posReduced),1)),squeeze(std(mdMapMatrixReducedMAP6(:,1:posReduced),1)),'b*')
hold on
errorbar(squeeze(mean(mdMapMatrixReducedMAP6(:,posReduced+1:end),1)),squeeze(std(mdMapMatrixReducedMAP6(:,posReduced+1:end),1)),'ro')

axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
%yticks(ticksArray)
%yticklabels(ticksLabels)
xlim([0 posReduced+1])
%ylim([0 1])
xlabel("Atlas ROI",'FontSize',14)
ylabel("Average MD [a.u.]",'FontSize',14)
legend("Right side (n=3)","Left side (n=3)",'FontSize',12)
title("MD comparison",'FontSize',14)

subplot(2,2,3)
plot(faMapMatrixReducedMAP6RightLeftPValue,'g*')
xlim([0 posReduced+1])
ylim([0 0.05])
axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
xlabel("Atlas ROI",'FontSize',14)
ylabel("p-value [a.u.]",'FontSize',14)
title("P-value - FA comparison",'FontSize',14)

subplot(2,2,4)
plot(mdMapMatrixReducedMAP6RightLeftPValue,'g*')
xlim([0 posReduced+1])
ylim([0 0.05])
axis on
ax = gca;
ax.FontSize = ticksFontSizeForSymAnalysis; 
xticks(ticksArrayForSymAnalysis)
xticklabels(ticksLabelsForSymAnalysis)
xtickangle(90)
xlabel("Atlas ROI",'FontSize',14)
ylabel("p-value [a.u.]",'FontSize',14)
title("P-value - MD comparison",'FontSize',14)

sgtitle([analysisTitle,"Symmetry analysis of MAP6^{+/-} mice",""],'FontSize',18)

if saveData
    saveas(gcf,strcat(pathSaveData,'faMDMapsComparison_symmetryAnalysis_map6Mice.fig'))
    exportgraphics(gcf,strcat(pathSaveData,'faMDMapsComparison_symmetryAnalysis_map6Mice.png'),'Resolution',600)
    
    save(strcat(pathSaveData,'analysisDiffusionParametricMaps_matlabWorkspace.mat'))
end