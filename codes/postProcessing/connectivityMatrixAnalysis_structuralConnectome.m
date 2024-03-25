% Connectivity matrix analysis - Structural connectome
close all
clear
clc


posReduced = 25;
firstPosNull = 1;

pathConnectomeArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/connectome/M672/connectome_continuousLabels_M672_track_1_0.3.csv";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/connectome/M872/connectome_continuousLabels_track_3_0.27_M872.csv";...
    ];
corrMatrixWTReduced = zeros(posReduced*2,posReduced*2,size(pathConnectomeArray,1));


index = 1;
corrMatrixWT(:,:,index) = csvread(pathConnectomeArray(index));
corrMatrixWTReduced(1:posReduced,1:posReduced,index) = corrMatrixWT((1+firstPosNull):(posReduced+firstPosNull),(1+firstPosNull):(posReduced+firstPosNull),index);
corrMatrixWTReduced(posReduced+1:end,posReduced+1:end,index) = corrMatrixWT(((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull):((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull + posReduced - 1),((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull):((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull + posReduced - 1),index);

index = 2;
corrMatrixWT(:,:,index) = csvread(pathConnectomeArray(index));
corrMatrixWTReduced(1:posReduced,1:posReduced,index) = corrMatrixWT((1+firstPosNull):(posReduced+firstPosNull),(1+firstPosNull):(posReduced+firstPosNull),index);
corrMatrixWTReduced(posReduced+1:end,posReduced+1:end,index) = corrMatrixWT(((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull):((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull + posReduced - 1),((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull):((size(corrMatrixWT,1) - firstPosNull)/2 + 1 + firstPosNull + posReduced - 1),index);
%figure('units','normalized','outerposition',[0 0 1 1]);
%imshow(squeeze(corrMatrixWT(:,:,index)),[])
%colormap 'jet'


figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1)
imshow(squeeze(corrMatrixWTReduced(:,:,1)),[])
colormap 'jet'
colorbar
title("M672 - cutoff: 0.3")

subplot(1,2,2)
imshow(squeeze(corrMatrixWTReduced(:,:,2)),[])
colormap 'jet'
colorbar
title("M872 - cutoff: 0.27")
sgtitle("Structural connectome")
