% Transform registered labels in 3D images
close all
clear
clc

pathRegAtlas = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/registeredAtlas_continuousLabels.nii";...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/registeredAtlas_continuousLabels.nii";...
    ];


imageShow = 1;
imageSave = 1;

showX = 67;
showY = 100;
showZ = 50;

formatSpec = '%.3d';
%%
for pathNum=1:size(pathRegAtlas,1)
    
    path = pathRegAtlas(pathNum)
    [pathFolder, pathName, pathExt] = fileparts(path);
    
    atlasRegImage = niftiread(path);
    atlasRegInfo = niftiinfo(path);
    
    labelInit  = min(atlasRegImage(:));
    labelFinal = max(atlasRegImage(:));
    
    
    
    for labelNum=labelInit:labelFinal
        
        atlasRegROI = zeros(size(atlasRegImage,1),size(atlasRegImage,2),size(atlasRegImage,3));
        [idx] = find(atlasRegImage==labelNum);
        atlasRegROI(idx) = 1;
        
        if (imageShow && (idx>0))
            figure('units','normalized','outerposition',[0 0 1 1]);
            subplot(2,3,1)
            imshow(abs(squeeze(atlasRegImage(:,:,showZ))),[]);
            colormap 'jet'

            subplot(2,3,2)
            imshow(abs(squeeze(atlasRegImage(:,showY,:))),[]);
            colormap 'jet'

            subplot(2,3,3)
            imshow(abs(squeeze(atlasRegImage(showX,:,:))),[]);
            colormap 'jet'

            subplot(2,3,4)
            imshow(abs(squeeze(atlasRegROI(:,:,showZ))),[]);
            colormap 'jet'

            subplot(2,3,5)
            imshow(abs(squeeze(atlasRegROI(:,showY,:))),[]);
            colormap 'jet'

            subplot(2,3,6)
            imshow(abs(squeeze(atlasRegROI(showX,:,:))),[]);
            colormap 'jet'  
            
            sgtitle(strcat("Subject: ", num2str(pathNum), " - label: ", num2str(labelNum)))
        end
        
        
        pause(2)
        close all
        
        if (imageSave && (idx>0))          
            niftiwrite(single(atlasRegROI), strcat(pathFolder, "/", pathName, "_roiLabel-",num2str(labelNum,formatSpec),pathExt), atlasRegInfo);            
        end
        
    end
    
end

