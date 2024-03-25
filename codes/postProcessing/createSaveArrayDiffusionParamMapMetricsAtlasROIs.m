% Create array of diffusion parametric map metrics within ROIs

close all
clear 
clc

diffParamImageArray = ["FA_map.nii","ADC_map.nii"];
regAtlasForConnectomeArray = ["registeredAtlas_continuousLabels.nii","registeredAtlas_originalLabels.nii"];
brainMask = "mask_den_unr_preproc_unb.nii";

pathSubjectsArray = [...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-1/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-2/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-3/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-4/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-5/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-6/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-7/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-8/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-9/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-10/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-11/",...
    "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/postProcessing/tractographyConnectome/20230603_022151_MRtrix-output_studyWt-MAP6Mice_allMice_6wt-6hetMAP6/Mouse-12/",...
];

xSlice = 67;
ySlice = 100;
zSlice = 50;

showResults = 1;
saveData = 1;


%%

for pathSubj=pathSubjectsArray
    fprintf("\n\n####################################################\nProcessing %s ...\n",pathSubj)
    
    imageBrainMask = niftiread(strcat(pathSubj,brainMask));
    
    
    for regAtlas=regAtlasForConnectomeArray
        fprintf("\n\n****************************************************\nProcessing %s ...\n",regAtlas)
        
        imageRegAtlas = niftiread(strcat(pathSubj,regAtlas));
        imageRegAtlasCorr = imageRegAtlas.*imageBrainMask;
        
        for diffParMap=diffParamImageArray
            fprintf("\n\n----------------------------------------------------\nProcessing %s ...\n",diffParMap)
                        
            imageDiffParMap = niftiread(strcat(pathSubj,diffParMap));
            
            if (showResults)
                figure('units','normalized','outerposition',[0 0 1 1]);
                subplot(1,4,1)
                imshow(squeeze(imageDiffParMap(:,:,zSlice)),[])
                colormap 'jet'
                title(diffParMap)

                subplot(1,4,2)
                imshow(squeeze(imageBrainMask(:,:,zSlice)),[])
                colormap 'gray'
                title("brainMask")

                subplot(1,4,3)
                imshow(squeeze(imageRegAtlas(:,:,zSlice)),[])
                colormap 'hot'
                title(strcat("Original ",regAtlas))

                subplot(1,4,4)
                imshow(squeeze(imageRegAtlasCorr(:,:,zSlice)),[])
                colormap 'hot'
                title(strcat("Corrected ",regAtlas))
            end
            
            regAtlasRegMax = max(imageRegAtlasCorr(:));
            diffParMapValueROIMeanArray = zeros(1,regAtlasRegMax);
            diffParMapValueROIMedianArray = zeros(1,regAtlasRegMax);
            diffParMapValueROIStdArray = zeros(1,regAtlasRegMax);
            diffParMapValueROIMinArray = zeros(1,regAtlasRegMax);
            diffParMapValueROIMaxArray = zeros(1,regAtlasRegMax);
            
            for regAtlasReg=1:regAtlasRegMax
                
                [idx] = find(imageRegAtlasCorr==regAtlasReg);
                
                diffParMapValueROIMeanArray(regAtlasReg) = mean(imageDiffParMap(idx));
                diffParMapValueROIMedianArray(regAtlasReg) = median(imageDiffParMap(idx));
                diffParMapValueROIStdArray(regAtlasReg) = std(imageDiffParMap(idx));
                %diffParMapValueROIMinArray(regAtlasReg) = min(imageDiffParMap(idx));
                %diffParMapValueROIMaxArray(regAtlasReg) = max(imageDiffParMap(idx));
                
            end
            
            if (showResults)
               figure('units','normalized','outerposition',[0 0 1 1]);
               subplot(2,3,1)
               plot(diffParMapValueROIMeanArray')
               title("Mean value within ROIs")
               
               subplot(2,3,2)
               plot(diffParMapValueROIMedianArray')
               title("Median value within ROIs")
               
               subplot(2,3,4)
               plot(diffParMapValueROIStdArray')
               title("Std value within ROIs")
               
               %subplot(2,3,5)
               %plot(diffParMapValueROIMinArray')
               %title("Min value within ROIs")
               
               %subplot(2,3,6)
               %plot(diffParMapValueROIMaxArray')
               %title("Max value within ROIs")
            end
            
            if (saveData)
                
                regAtlasChar = convertStringsToChars(regAtlas);
                diffParMapChar = convertStringsToChars(diffParMap);
                csvwrite(strcat(pathSubj,"diffusionParametricMapMetricsWithinROIAtlas_meanValue_",diffParMapChar(1:end-4),"_",regAtlasChar(1:end-4),".csv"), diffParMapValueROIMeanArray);
                csvwrite(strcat(pathSubj,"diffusionParametricMapMetricsWithinROIAtlas_medianValue_",diffParMapChar(1:end-4),"_",regAtlasChar(1:end-4),".csv"), diffParMapValueROIMedianArray);
                csvwrite(strcat(pathSubj,"diffusionParametricMapMetricsWithinROIAtlas_stdValue_",diffParMapChar(1:end-4),"_",regAtlasChar(1:end-4),".csv"), diffParMapValueROIStdArray);
            end
            
            
            fprintf("Processing of %s done!!!\n----------------------------------------------------\n",diffParMap)
            pause(4)
            close all
        end
        
        fprintf("Processing of %s done!!!\n****************************************************\n\n",regAtlas)
    end
    
    fprintf("Processing of %s done!!!\n####################################################\n\n",pathSubj)
end