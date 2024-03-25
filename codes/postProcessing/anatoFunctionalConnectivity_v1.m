close all
clear
clc

labels = ["FP_R","SMa_R","SSa_R","GVAa_R","Va_R","FC_R","TPEa_R","Oa_R","HP_R","PHr_R","OS_R","SD_R","SV_R","Sr_R","Aa_R","PL_R","TH_R","HT_R","CO_R","MB_R","SN_R","PO_R","ME_R","CVr_R","CHr_R","FP_L","SMa_L","SSa_L","GVAa_L","Va_L","FC_L","TPEa_L","Oa_L","HP_L","PHr_L","OS_L","SD_L","SV_L","Sr_L","Aa_L","PL_L","TH_L","HT_L","CO_L","MB_L","SN_L","PO_L","ME_L","CVr_L","CHr_L"];
regValueForAnatConnMatrix = 0.1;

pathSave = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/results_v2";
saveFigures = 0;
%%

load("/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/structuralConnectomeCompilation_matlabWorkspace_symmetric-zeroDiagonal.mat",'corrMatrixMAP6Mean','corrMatrixWTMean')
corrMatrixWTMeanAnat = corrMatrixWTMean - regValueForAnatConnMatrix;
corrMatrixMAP6MeanAnat = corrMatrixMAP6Mean - regValueForAnatConnMatrix;

load("/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/structuralConnectomeCompilation_matlabWorkspace_symmetric-zeroDiagonal-scaleInvnodevol.mat",'corrMatrixMAP6Mean','corrMatrixWTMean')
corrMatrixWTMeanAnatNorm = corrMatrixWTMean - regValueForAnatConnMatrix;
corrMatrixMAP6MeanAnatNorm = corrMatrixMAP6Mean - regValueForAnatConnMatrix;

%load("/data_network/summer_projects/alvesrod/Share/2022_mouse-rsfMRI/outputs/conectivityMatrices/20230511_025735_secondAcquisition-groupedProcessing_allSubjects_nLabels-25_butterworthFilter_lowCut-0.0625_highCut-0.125_fs-1.0_filterOrder-7_invProblParam-1.0e+06_weightNormOption-1_eraseFirstLabelOption-1/metrics/connectivityMatrixCompilation_matlabWorkspace.mat", 'corrMatrixWTMean', 'corrMatrixMAP6Mean')
%corrMatrixWTMeanFunc = corrMatrixWTMean;
%corrMatrixMAP6MeanFunc = corrMatrixMAP6Mean;
load("/data_network/summer_projects/alvesrod/Share/2022_mouse-rsfMRI/outputs/conectivityMatrices/20230504_014621_allSubjects_secondAcquisition_nLabels-25_butterworthFilter_lowCut-0.0625_highCut-0.125_fs-1.0_filterOrder-5_invProblParam-0.001_weightNormOption-1_eraseFirstLabelOption-1/connectivityMatrix_F585_25Labels_weightNorm.mat")
corrMatrixWTMeanFunc = cormat;

load("/data_network/summer_projects/alvesrod/Share/2022_mouse-rsfMRI/outputs/conectivityMatrices/20230504_014621_allSubjects_secondAcquisition_nLabels-25_butterworthFilter_lowCut-0.0625_highCut-0.125_fs-1.0_filterOrder-5_invProblParam-0.001_weightNormOption-1_eraseFirstLabelOption-1/connectivityMatrix_F582_25Labels_weightNorm.mat")
corrMatrixMAP6MeanFunc = cormat;


corrMatrixWTMeanAnatArray = TransfUpperMatrix2Array(corrMatrixWTMeanAnat);
corrMatrixMAP6MeanAnatArray = TransfUpperMatrix2Array(corrMatrixMAP6MeanAnat);

corrMatrixWTMeanAnatNormArray = TransfUpperMatrix2Array(corrMatrixWTMeanAnatNorm);
corrMatrixMAP6MeanAnatNormArray = TransfUpperMatrix2Array(corrMatrixMAP6MeanAnatNorm);

corrMatrixWTMeanFuncArray = TransfUpperMatrix2Array(corrMatrixWTMeanFunc);
corrMatrixMAP6MeanFuncArray = TransfUpperMatrix2Array(corrMatrixMAP6MeanFunc);


labelsSize = size(labels,2);
labelCombArray = strings(1,size(corrMatrixMAP6MeanFuncArray,1));

index = 1;
for line=1:labelsSize
    
    for column=1:labelsSize
        
        if (line < column)
            labelCombArray(index) = strcat(labels(line),"-",labels(column));
            index = index + 1;
        end          
    end
    
end

ticksArray = [1:1:size(labels,2)];
ticksLabels = strrep(labels,'_', '\_');
ticksFontSize = 5;

ticksArrayComb = [1:1:size(labelCombArray,2)];
ticksLabelsComb = strrep(labelCombArray,'_', '\_');
ticksFontSizeComb = 5;


figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,3,1)
imshow(squeeze(corrMatrixWTMeanFunc),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([-1 1])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(["Functional connectivity matrix","Mouse F585"],'FontSize',12)

subplot(2,3,2)
imshow(squeeze(corrMatrixWTMeanAnatNorm),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([0 1.5])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(["Mean anatomical connectivity matrix","(normalized by volume)"],'FontSize',12)

subplot(2,3,3)
imshow(squeeze(corrMatrixWTMeanAnat),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([0 20000])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(["Mean anatomical connectivity matrix", "(num. streamlines)"],'FontSize',12)


subplot(2,3,5)
plot(corrMatrixWTMeanAnatNormArray',abs(corrMatrixWTMeanFuncArray)','ob')
xlim([-0.1 0.25])
ylim([-0.05 1])
xlabel("Anatomical connectivity [a.u.]")
ylabel("|Functional connectivity| [a.u.]")
title(["Functional vs anatomical connectivity","(anat. conn. matrix normalized by volume)"],'FontSize',12)
hold on
plot([0:1.59/1224:1.59]',[0:1/1224:1]','-r')


subplot(2,3,6)
plot(corrMatrixWTMeanAnatArray',abs(corrMatrixWTMeanFuncArray)','ob')
xlim([-1000 2000])
ylim([-0.05 1])
xlabel("Anatomical connectivity [a.u.]")
ylabel("|Functional connectivity| [a.u.]")
title(["Functional vs anatomical connectivity","(anat. conn. matrix num. of streamlines)"],'FontSize',12)
hold on
plot([0:22000/1224:22000]',[0:1/1224:1]','-r')

sgtitle(["Anatofunctional connectivity of WT mice",""], 'FontSize',16)

if saveFigures
    saveas(gcf,strcat(pathSave,'/anatofunctionalConnectivity_wtMice.fig'))    
    exportgraphics(gcf,strcat(pathSave,'/anatofunctionalConnectivity_wtMice.png'),'Resolution',600) 
end


figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,3,1)
imshow(squeeze(corrMatrixMAP6MeanFunc),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([-1 1])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(["Functional connectivity matrix","Mouse F582"],'FontSize',12)

subplot(2,3,2)
imshow(squeeze(corrMatrixMAP6MeanAnatNorm),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([0 1.5])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(["Mean anatomical connectivity matrix","(normalized by volume)"],'FontSize',12)

subplot(2,3,3)
imshow(squeeze(corrMatrixMAP6MeanAnat),[])
colormap 'jet'
c = colorbar;
c.FontSize = 10;
caxis([0 20000])
axis on
ax = gca;
ax.FontSize = ticksFontSize; 
xticks(ticksArray)
xticklabels(ticksLabels)
xtickangle(90)
yticks(ticksArray)
yticklabels(ticksLabels)
title(["Mean anatomical connectivity matrix", "(num. streamlines)"],'FontSize',12)


subplot(2,3,5)
plot(corrMatrixMAP6MeanAnatNormArray',abs(corrMatrixMAP6MeanFuncArray)','ob')
xlim([-0.1 1.59])
ylim([-0.05 1])
xlabel("Anatomical connectivity [a.u.]")
ylabel("|Functional connectivity| [a.u.]")
title(["Functional vs anatomical connectivity","(anat. conn. matrix normalized by volume)"],'FontSize',12)
hold on
plot([0:1.59/1224:1.59]',[0:1/1224:1]','-r')


subplot(2,3,6)
plot(corrMatrixMAP6MeanAnatArray',abs(corrMatrixMAP6MeanFuncArray)','ob')
xlim([-1000 22000])
ylim([-0.05 1])
xlabel("Anatomical connectivity [a.u.]")
ylabel("|Functional connectivity| [a.u.]")
title(["Functional vs anatomical connectivity","(anat. conn. matrix num. of streamlines)"],'FontSize',12)
hold on
plot([0:22000/1224:22000]',[0:1/1224:1]','-r')

sgtitle(["Anatofunctional connectivity of MAP6^{+/-} mice",""], 'FontSize',16)

if saveFigures
    saveas(gcf,strcat(pathSave,'/anatofunctionalConnectivity_hetMAP6Mice.fig'))    
    exportgraphics(gcf,strcat(pathSave,'/anatofunctionalConnectivity_hetMAP6Mice.png'),'Resolution',600) 
end


%%
figure;
plot(ticksArrayComb',corrMatrixWTMeanFuncArray','ob')
axis on
ax = gca;
ax.FontSize = 2; 
xticks(ticksArrayComb)
xticklabels(ticksLabelsComb)
xtickangle(90)



%c = colorbar;
%c.FontSize = 10;

%axis on
%ax = gca;
%ax.FontSize = ticksFontSizeComb; 
%xticks(ticksArrayComb)
%xticklabels(ticksLabelsComb)
%xtickangle(90)
%yticks(ticksArrayComb)
%yticklabels(ticksLabelsComb)

function array = TransfUpperMatrix2Array(matrix)

    D = diag(matrix);
    array = [D.', squareform((matrix-diag(D)).')]';
    array = array(size(matrix,1)+1:end);

end
