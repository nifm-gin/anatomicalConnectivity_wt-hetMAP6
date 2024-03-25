# -*- coding: utf-8 -*

import tkinter as tk
from tkinter import filedialog, messagebox
import os
import subprocess
import math
import datetime

root = tk.Tk()
root.withdraw()

def str2bool(v):
  return v.lower() in ("yes", "true", "1","ok","oui")

result = subprocess.run(['reset'], stdout=subprocess.PIPE)
print("\n\n#####################################################################################################")
print("\n\nData processing script for MRtrix3 - Coded by Diego ALVES RODRIGUES DE SOUZA")
print("\n\n#####################################################################################################")

niiPathVector=[]
niiFileVector=[]
bvecBvalFilePathVector=[]
externalMaskPathVector=[]



print("\n\n#####################################################################################################")
print("\n\nChoose input way:")
print("\n\n#####################################################################################################")

inputByFile = messagebox.askyesno("Option to choose file", "Would you like to choose a .txt file with all parameters?")

#Read file with parameters
if (inputByFile):
    print("Input by file chosen.")
    message=messagebox.showinfo("Parameter file choice","Choose your file containing tractography parameters on the next window...")
    inputFilePath = filedialog.askopenfilename(title="Choose file with parameter")
    print("Input file path:")
    print(inputFilePath)

    important = []
    keep_phrases = ["QuantityOfMice:","VoxelSizeString:","NumberOfDirections:","NumberOfStreamlines:","Cutoff:","StepSize:","Curvature:","TractographyAlgorithm","ROIsToBeAnalysed:","SiftTypes","SiftValues","SeeAllImagesAfterEachFilter","PerformROIFilteringOnly","PerformStatisticsOnly","PerformSift","ExternalMask","WorkPath","ProvideListOfImages","SameMask","SameBvecsBvals","FolderComment","NumberOfThreads"]

    with open(inputFilePath) as f:
        f = f.readlines()

    for line in f:
        for phrase in keep_phrases:
            if phrase in line:
                important.append(line)
                break

    print(important)
    important=[w.replace('QuantityOfMice: ', '').replace('VoxelSizeString: ', '').replace('NumberOfDirections: ', '').replace('NumberOfStreamlines: ', '').replace('Cutoff: ', '').replace('StepSize: ', '').replace('Curvature: ', '').replace('TractographyAlgorithm: ', '').replace('ROIsToBeAnalysed: ', '').replace('SiftTypes: ', '').replace('SiftValues: ', '').replace('SeeAllImagesAfterEachFilter: ', '').replace('PerformROIFilteringOnly: ', '').replace('PerformStatisticsOnly: ', '').replace('PerformSiftOnly: ', '').replace('ExternalMask: ', '').replace('WorkPath: ', '').replace('ProvideListOfImages: ', '').replace('SameMask: ', '').replace('SameBvecsBvals: ', '').replace('FolderComment: ', '').replace('NumberOfThreads: ', '').replace('\n', '') for w in important]
    important=[w.replace('QuantityOfMice:', '').replace('VoxelSizeString:', '').replace('NumberOfDirections:', '').replace('NumberOfStreamlines:','').replace('Cutoff:','').replace('StepSize:', '').replace('Curvature:', '').replace('TractographyAlgorithm:', '').replace('ROIsToBeAnalysed:', '').replace('SiftTypes:', '').replace('SiftValues:', '').replace('SeeAllImagesAfterEachFilter:', '').replace('PerformROIFilteringOnly:', '').replace('PerformStatisticsOnly:', '').replace('PerformSiftOnly:', '').replace('ExternalMask:', '').replace('WorkPath:', '').replace('ProvideListOfImages:', '').replace('SameMask:', '').replace('SameBvecsBvals:', '').replace('FolderComment:', '').replace('NumberOfThreads:', '').replace('\n', '') for w in important]
    important=[w.replace('\n', '').replace(':', '').replace(' ', '') for w in important]
    print(important)

    quantityOfMice=int(important[0])
    voxelSizeString = important[1]
    numberOfDirections = int(important[2])

    numberOfStreamlineVector=list(map(int,important[3].split(",")))

    cutoffVector = list(map(float,important[4].split(",")))
    stepSizeVector = list(map(float,important[5].split(",")))
    curvature = float(important[6])
    tractAlgoVector =important[7].split(",")
    whichROI =important[8].split(",")

    siftTypeArray = important[9].split(",")
    siftValueArray = list(map(float,important[10].split(",")))

    viewResults = str2bool(important[11])
    onlyROIFiltering = str2bool(important[12])
    onlyStatistics = str2bool(important[13])

    performSiftOnly = str2bool(important[14])

    externalMask = str2bool(important[15])

    workPath = important[16]

    provideListOfImages = str2bool(important[17])
    sameExternalMask = str2bool(important[18])
    sameBvecsBvals = str2bool(important[19])

    folderComment = important[20]

    nThreads = int(important[21])



    print(quantityOfMice)
    print(voxelSizeString)
    print(numberOfDirections)
    print(numberOfStreamlineVector)
    print(cutoffVector)
    print(stepSizeVector)
    print(curvature)
    print(tractAlgoVector)
    print(whichROI)

    print(siftTypeArray)
    print(siftValueArray)

    print(viewResults)
    print(onlyROIFiltering)
    print(onlyStatistics)

    print(performSiftOnly)

    print(externalMask)
    print(workPath)

    print(provideListOfImages)
    print(sameExternalMask)
    print(sameBvecsBvals)

    print(folderComment)

    print(nThreads)



#Enter manually all parameters
else:
    print("Manual input chosen.")
    message = messagebox.showinfo("Manual input of parameters","Fill the following windows with the parameters of tractography...")

#quantityOfMice = 1
#viewResults = False
#onlyROIFiltering = False
#onlyStatistics = False
#numberOfDirections=16

#numberOfStreamlineVector=[10000,100000]
#cutoffVector=[0.15,0.20,0.25]
#stepSizeVector=[0.01,0.008]
#curvature=0.07 #It will be used to calculate the angle by doing angle=math.round(math.degrees(2*asin(step/(2*curvature))),4)
#whichROI=['f','vhc','st','sm']
#whichROI=['ac','fr']


if ((not(onlyROIFiltering)) and (not(performSiftOnly))):

    #'''''''''Comment!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    quantityFlag=quantityOfMice

    while (quantityFlag > 0):
        if not (provideListOfImages):
            message = messagebox.showinfo("Nii file choice","Choose your MRtrix3 .nii file for mouse " + str(quantityOfMice-quantityFlag+1)+ " on the next window...")
            niiFilePath = filedialog.askopenfilename(initialdir = workPath)


            if not (sameBvecsBvals):
                message = messagebox.showinfo("Bvecs and bvals file choice","Choose your txt file containing MRtrix3 bvecs&bvals for mouse " + str(quantityOfMice-quantityFlag+1)+ " on the next window...")
                bvecBvalFilePath = filedialog.askopenfilename(initialdir = workPath)

            if (sameBvecsBvals and (quantityFlag==quantityOfMice)):
                message = messagebox.showinfo("Bvecs and bvals file choice","Choose your single txt file containing MRtrix3 bvecs&bvals for all mice on the next window...")
                bvecBvalFilePath = filedialog.askopenfilename(initialdir = workPath)

            if (sameBvecsBvals and (quantityFlag!=quantityOfMice)):
                #message = messagebox.showinfo("Bvecs and bvals file choice","Choose your MRtrix3 bvecs&bvals file for mouse " + str(quantityOfMice-quantityFlag+1)+ " on the next window...")
                bvecBvalFilePath = bvecBvalFilePathVector[0]


            if((externalMask) and (not(sameExternalMask))):
                message = messagebox.showinfo("Mask choice","Choose your external mask file for mouse " + str(quantityOfMice - quantityFlag + 1) + " on the next window...")
                externalMaskPath = filedialog.askopenfilename(initialdir=workPath)
                externalMaskPathVector.append(externalMaskPath)

            if((externalMask) and (sameExternalMask) and (quantityFlag==quantityOfMice)):
                message = messagebox.showinfo("Mask choice","Choose your single external mask file for all mice on the next window...")
                externalMaskPath = filedialog.askopenfilename(initialdir=workPath)
                externalMaskPathVector.append(externalMaskPath)

            if ((externalMask) and (sameExternalMask) and (quantityFlag != quantityOfMice)):
                #message = messagebox.showinfo("Mask choice", "Choose your external mask file for mouse " + str(quantityOfMice - quantityFlag + 1) + " on the next window...")
                externalMaskPath = externalMaskPathVector[0]
                externalMaskPathVector.append(externalMaskPath)
            #niiPath, niiFile = os.path.split(niiFilePath)
            #bvecBvalPath, bvecBvalFile = os.path.split(bvecBvalFilePath)
            niiPathVector.append(niiFilePath)
            bvecBvalFilePathVector.append(bvecBvalFilePath)

        else:
            if (quantityFlag == quantityOfMice):
                #niiPathVector.append(niiFilePath)
                message = messagebox.showinfo("Choice of list of .nii files", "Choose a txt doc containing the list of all " + str(quantityOfMice) + " images to be processed...")
                allImagesTxtDocPath = filedialog.askopenfilename(initialdir=workPath)

                with open(allImagesTxtDocPath) as file:
                    file = file.readlines()
                niiPathVectorTemp = file
                #for line in file:
                    #niiPathVector.append(line)
                    #break

            if not (sameBvecsBvals):
                message = messagebox.showinfo("Bvecs and bvals file choice","Choose your txt file containing MRtrix3 bvecs&bvals for mouse " + str(quantityOfMice - quantityFlag + 1) + " on the next window...")
                bvecBvalFilePath = filedialog.askopenfilename(initialdir=workPath)

            if (sameBvecsBvals and (quantityFlag == quantityOfMice)):
                message = messagebox.showinfo("Bvecs and bvals file choice","Choose your single txt file containing MRtrix3 bvecs&bvals for all mice on the next window...")
                bvecBvalFilePath = filedialog.askopenfilename(initialdir=workPath)

            if (sameBvecsBvals and (quantityFlag != quantityOfMice)):
                # message = messagebox.showinfo("Bvecs and bvals file choice","Choose your MRtrix3 bvecs&bvals file for mouse " + str(quantityOfMice-quantityFlag+1)+ " on the next window...")
                bvecBvalFilePath = bvecBvalFilePathVector[0]

            if ((externalMask) and (not (sameExternalMask))):
                message = messagebox.showinfo("Mask choice", "Choose your external mask file for mouse " + str(quantityOfMice - quantityFlag + 1) + " on the next window...")
                externalMaskPath = filedialog.askopenfilename(initialdir=workPath)
                externalMaskPathVector.append(externalMaskPath)

            if ((externalMask) and (sameExternalMask) and (quantityFlag == quantityOfMice)):
                message = messagebox.showinfo("Mask choice", "Choose your single external mask file for all mice on the next window...")
                externalMaskPath = filedialog.askopenfilename(initialdir=workPath)
                externalMaskPathVector.append(externalMaskPath)

            if ((externalMask) and (sameExternalMask) and (quantityFlag != quantityOfMice)):
                # message = messagebox.showinfo("Mask choice", "Choose your external mask file for mouse " + str(quantityOfMice - quantityFlag + 1) + " on the next window...")
                externalMaskPath = externalMaskPathVector[0]
                externalMaskPathVector.append(externalMaskPath)
            # niiPath, niiFile = os.path.split(niiFilePath)
            # bvecBvalPath, bvecBvalFile = os.path.split(bvecBvalFilePath)
            #niiPathVector.append(niiFilePath)
            bvecBvalFilePathVector.append(bvecBvalFilePath)

        quantityFlag -=1

    if (provideListOfImages):
        niiPathVector = [x[:-1] for x in niiPathVectorTemp[0:quantityOfMice]]
        print("\nNii path temp vector:")
        print(len(niiPathVectorTemp))
        print(niiPathVectorTemp)
        #niiPathVector2 = map(lambda s: s.strip(), niiPathVector)


    print("\nNii Path vector:")
    print(len(niiPathVector))
    print(niiPathVector)
    print("\nBvec bval path vector:")
    print(len(bvecBvalFilePathVector))
    print(bvecBvalFilePathVector)
    print("\nExternal mask path vector:")
    print(len(externalMaskPathVector))
    print(externalMaskPathVector)

    message = messagebox.showinfo("Output folder choice", "Choose an output folder for the tractographies on the next window...")
    outputPath = filedialog.askdirectory(initialdir = workPath)

    now = datetime.datetime.now()

    newOutputFolderName = (now.strftime("%Y%m%d_%H%M%S_")) + 'MRtrix-output_' + folderComment
    #newOutputFolderName = 'MRtrix-output'
    newOutputPath = outputPath + '/' + newOutputFolderName
    os.chdir(outputPath)

    #'''Comment!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    proc = subprocess.run(['rm','-R', newOutputFolderName], stdout=subprocess.PIPE)
    proc = subprocess.run(['mkdir', newOutputFolderName], stdout=subprocess.PIPE)
    #print(result.stdout.decode('utf-8'))
    os.chdir(newOutputPath)

    # Change - 2020.03.12 - Copy parameter file to the output directory
    inputFileFolder, inputFileName = os.path.split(inputFilePath[quantityOfMice - quantityFlag])
    newInputFileName = (now.strftime("%Y%m%d_%H%M%S_")) + inputFileName
    result = subprocess.run(['cp', inputFilePath, './' + newInputFileName], stdout=subprocess.PIPE)
    # Change - 2020.03.12 - Copy parameter file to the output directory


    print("\n\n#####################################################################################################")
    print("\nInformation about paths:")
    print("\n######################################################################################################")

    print("\nOutput directories for each mouse:")

    print("\nNifTI file(s) to be processed:")
    print(niiPathVector)

    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
    with open("inputImages.txt", "w") as txt_file:
        for line in niiPathVector:
            txt_file.write(line + "\n")
    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------


    print("\nBvec and Bval file(s) to be considered:")
    print(bvecBvalFilePathVector)

    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
    with open("inputBvecsBvals.txt", "w") as txt_file:
        for line in bvecBvalFilePathVector:
            txt_file.write(line + "\n")
    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------


    if (externalMask):
        print("\nExternal mask file(s) to be considered:")
        print(externalMaskPathVector)

        # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
        with open("inputMasks.txt", "w") as txt_file:
            for line in externalMaskPathVector:
                txt_file.write(line + "\n")
        # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------



    print("\nOld output directory")
    print(outputPath)

    print("\nNew output directory:")
    print(newOutputPath)
    print("#####################################################################################################")


    #--------------------------------------------------------------------------------------------------------------------------------
    #Create output folders for each mouse
    individualFolderNameVector=[]

    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
    pathIndividualFolderNameVector = []
    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------

    quantityFlag=quantityOfMice
    while (quantityFlag > 0):
        individualFolderNameVector.append('Mouse-' + str(quantityOfMice-quantityFlag+1))
        proc = subprocess.run(['mkdir', individualFolderNameVector[quantityOfMice-quantityFlag]], stdout=subprocess.PIPE)

        # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
        pathIndividualFolderNameVector.append(newOutputPath + '/' + individualFolderNameVector[quantityOfMice-quantityFlag])
        # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------

        quantityFlag -= 1

    print("\n\n#####################################################################################################")
    print("\n\nOutput directories for each mouse:")
    print("\n######################################################################################################")
    proc = subprocess.run(['ls'])
    print("#####################################################################################################")

    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
    with open("outputDataFolders.txt", "w") as txt_file:
        for line in pathIndividualFolderNameVector:
            txt_file.write(line + "\n")
    # Rev 9 - 2021.05.27 - Make txt files concerning processed data ----------------------------------------------------
    #--------------------------------------------------------------------------------------------------------------------------------

    #--------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------------------------------------------------------------------------------------------------------
    #Start data processing


    print("\n\n#####################################################################################################")
    print("\nInformation about NifTIs to be processed:")
    print("\n######################################################################################################")
    quantityFlag=quantityOfMice
    while (quantityFlag > 0):

        print("\n----------------------------------------------------------------------------------------------")
        print(individualFolderNameVector[quantityOfMice-quantityFlag])
        print("----------------------------------------------------------------------------------------------")

        result = subprocess.run(['mrinfo', niiPathVector[quantityOfMice-quantityFlag]], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))
        quantityFlag -= 1

        print("------------------------------------------------------------------------------------------------------\n")

    print("#####################################################################################################")





    print("\n\n#####################################################################################################")
    print("\nConvertion to .mif files:")
    print("\n######################################################################################################")

    quantityFlag=quantityOfMice

    while (quantityFlag > 0):

        os.chdir(newOutputPath + '/' + individualFolderNameVector[quantityOfMice-quantityFlag])

        print("\n------------------------------------------------------------------------------------------------------")
        print(individualFolderNameVector[quantityOfMice-quantityFlag])
        print("----------------------------------------------------------------------------------------------")

        result = subprocess.run(['mrconvert', niiPathVector[quantityOfMice-quantityFlag],'-grad', bvecBvalFilePathVector[quantityOfMice-quantityFlag], '-vox', voxelSizeString, 'dwi_raw.mif'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        result = subprocess.run(['mrinfo','dwi_raw.mif'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        quantityFlag -= 1
        print("------------------------------------------------------------------------------------------------------\n")

    print("#####################################################################################################")



    print("\n\n#####################################################################################################")
    print("\nData processing:")
    print("\n######################################################################################################")

    quantityFlag=quantityOfMice

    while (quantityFlag > 0):

        os.chdir(newOutputPath + '/' + individualFolderNameVector[quantityOfMice-quantityFlag])

        print("\n------------------------------------------------------------------------------------------------------")
        print(individualFolderNameVector[quantityOfMice-quantityFlag])
        print("------------------------------------------------------------------------------------------------------")


        result = subprocess.run(['dwidenoise','dwi_raw.mif','dwi_den.mif','-noise','noise.mif'],stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        result = subprocess.run(['mrcalc','dwi_raw.mif','dwi_den.mif','-subtract','residual.mif'],stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        if viewResults:
            result = subprocess.run(['mrview','noise.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

            result = subprocess.run(['mrview','residual.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))


        result = subprocess.run(['mrdegibbs','dwi_den.mif','dwi_den_unr.mif','-axes','0,1'],stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        result = subprocess.run(['mrcalc','dwi_den.mif','dwi_den_unr.mif','-subtract','residualUnringed.mif'],stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))


        if viewResults:
            result = subprocess.run(['mrview','dwi_den_unr.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

            result = subprocess.run(['mrview','residualUnringed.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))



#Choice of masks --------------------------------------------------------------------------------------------------------

        if (externalMask):
            result = subprocess.run(['dwi2mask','dwi_den_unr.mif','mask_den_unr_preproc_unb_auto-obtained-by-dwi2mask.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

            print(externalMaskPathVector[quantityOfMice - quantityFlag])
            result = subprocess.run(['cp', externalMaskPathVector[quantityOfMice - quantityFlag], './'],stdout=subprocess.PIPE)
            externalMaskActualPath, externalMaskName = os.path.split(externalMaskPathVector[quantityOfMice - quantityFlag])

            result = subprocess.run(['mrconvert', externalMaskName , 'mask_den_unr_preproc_unb.mif'],stdout=subprocess.PIPE)

        else:
            result = subprocess.run(['dwi2mask', 'dwi_den_unr.mif', 'mask_den_unr_preproc_unb.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

# Choice of masks --------------------------------------------------------------------------------------------------------


# MD, RD and FA maps code added on 30.01.2021 -------------------------------------------------------------------------------------------------
        result = subprocess.run(['dwi2tensor', '-mask', 'mask_den_unr_preproc_unb.mif', 'dwi_den_unr.mif', 'dwi_tensor.mif'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        result = subprocess.run(['tensor2metric', 'dwi_tensor.mif', '-mask', 'mask_den_unr_preproc_unb.mif', '-adc', 'ADC_map.nii', '-fa', 'FA_map.nii', '-rd', 'RD_map.nii', '-ad', 'AD_map.nii', '-cl', 'CL_map.nii', '-cp', 'CP_map.nii', '-cs', 'CS_map.nii', '-value', 'EigenValue_map.nii', '-vector', 'EigenVector_map.nii'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        result = subprocess.run(['tensor2metric', 'dwi_tensor.mif', '-mask', 'mask_den_unr_preproc_unb.mif', '-adc', 'ADC_map.mif', '-fa', 'FA_map.mif','-rd', 'RD_map.mif', '-ad', 'AD_map.mif', '-cl', 'CL_map.mif', '-cp', 'CP_map.mif', '-cs', 'CS_map.mif','-value', 'EigenValue_map.mif', '-vector', 'EigenVector_map.mif'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        if viewResults:
            result = subprocess.run(['mrview', 'dwi_den_unr.mif', '-overlay.load', 'mask_den_unr_preproc_unb.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

            result = subprocess.run(['mrview', 'FA_map.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

            result = subprocess.run(['mrview', 'ADC_map.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

# -----------------------------------------------------------------------------


        if numberOfDirections==6:
            result = subprocess.run(['dwi2response', 'tournier', '-mask','mask_den_unr_preproc_unb.mif','-lmax','2','dwi_den_unr.mif','wm_response.txt','-voxel','voxels.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        elif numberOfDirections==15:
            result = subprocess.run(['dwi2response', 'tournier', '-mask','mask_den_unr_preproc_unb.mif','-lmax','4','dwi_den_unr.mif','wm_response.txt','-voxel','voxels.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        elif numberOfDirections==30:
            result = subprocess.run(['dwi2response', 'tournier', '-mask', 'mask_den_unr_preproc_unb.mif', '-lmax', '6', 'dwi_den_unr.mif','wm_response.txt', '-voxel', 'voxels.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        elif numberOfDirections==60:
            result = subprocess.run(['dwi2response', 'tournier', '-mask', 'mask_den_unr_preproc_unb.mif', '-lmax', '8', 'dwi_den_unr.mif','wm_response.txt', '-voxel', 'voxels.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        else:
            break



        if viewResults:
            result = subprocess.run(['mrview','dwi_den_unr.mif','-overlay.load','voxels.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        if numberOfDirections==6:
            result = subprocess.run(['dwi2fod', 'csd', 'dwi_den_unr.mif','-mask','mask_den_unr_preproc_unb.mif','-lmax','2','wm_response.txt','wmfod.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        elif numberOfDirections==15:
            result = subprocess.run(['dwi2fod', 'csd', 'dwi_den_unr.mif','-mask','mask_den_unr_preproc_unb.mif','-lmax','4','wm_response.txt','wmfod.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        elif numberOfDirections==30:
            result = subprocess.run(['dwi2fod', 'csd', 'dwi_den_unr.mif', '-mask','mask_den_unr_preproc_unb.mif','-lmax','6','wm_response.txt','wmfod.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        elif numberOfDirections==60:
            result = subprocess.run(['dwi2fod', 'csd', 'dwi_den_unr.mif', '-mask','mask_den_unr_preproc_unb.mif','-lmax','8','wm_response.txt','wmfod.mif'], stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))

        else:
            break



        result = subprocess.run(['mrconvert','-coord','3','0','wmfod.mif','vf.mif'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        if viewResults:
            result = subprocess.run(['mrview','vf.mif','-odf.load_sh','wmfod.mif'],stdout=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))



        result = subprocess.run(['mtnormalise','wmfod.mif','wmfod_norm.mif','-mask','mask_den_unr_preproc_unb.mif'], stdout=subprocess.PIPE)
        print(result.stdout.decode('utf-8'))

        for tractAlgo in tractAlgoVector:
            for numberOfStreamLines in numberOfStreamlineVector:
                for cutoff in cutoffVector:
                    for stepSize in stepSizeVector:

                        strCutoff = ('%.4f' % cutoff)
                        angle = round(math.degrees(2 * math.asin(stepSize / (2 * curvature))), 4)

                        if (tractAlgo=='iFOD1' or tractAlgo=='iFOD2' or tractAlgo=='SD_Stream' or tractAlgo=='Nulldist1' or tractAlgo=='Nulldist2'):
                            result = subprocess.run(
                                ['tckgen', '-algorithm' , tractAlgo, '-seed_random_per_voxel', 'mask_den_unr_preproc_unb.mif', str(numberOfStreamLines),
                                 '-cutoff', strCutoff, 'wmfod_norm.mif', '-minlength', '0.1', '-maxlength', '50', '-step',
                                 str(stepSize), '-angle', str(angle), 'tracks_' + tractAlgo + '_' + str(
                                    numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                    stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (tractAlgo=='Tensor_Det' or tractAlgo=='Tensor_Prob'):
                            result = subprocess.run(
                                ['tckgen', '-algorithm', tractAlgo, '-seed_random_per_voxel',
                                 'mask_den_unr_preproc_unb.mif', str(numberOfStreamLines),
                                 '-cutoff', strCutoff, 'dwi_den_unr.mif', '-minlength', '0.1', '-maxlength', '50',
                                 '-step',
                                 str(stepSize), '-angle', str(angle), 'tracks_' + tractAlgo + '_' + str(
                                    numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                    stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)],
                                stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (tractAlgo=='FACT'):
                            result = subprocess.run(
                                ['tckgen', '-algorithm', tractAlgo, '-seed_random_per_voxel',
                                 'mask_den_unr_preproc_unb.mif', str(numberOfStreamLines),
                                 '-cutoff', strCutoff, 'EigenVector_map.mif', '-minlength', '0.1', '-maxlength', '50',
                                 '-step',
                                 str(stepSize), '-angle', str(angle), 'tracks_' + tractAlgo + '_' + str(
                                    numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                    stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)],
                                stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        else:
                            print("\nError: The tractography algorithm chosen (%s) is not implemented in this script!!!\r\n" % tractAlgo)


                        firstTimeSiftStandardFlag = 0
                        for siftType in siftTypeArray:
                            for siftValue in siftValueArray:

                                print('Performing sift...')

                                if ((siftType == 'standard') and (not(firstTimeSiftStandardFlag))):
                                    siftTerminus = '_sift-standard'
                                    result = subprocess.run(
                                        ['tcksift', 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + '.tck', 'wmfod_norm.mif', 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'], stdout=subprocess.PIPE)
                                    print(result.stdout.decode('utf-8'))
                                    firstTimeSiftStandardFlag = 1

                                if (siftType=='term_mu'):
                                    siftTerminus = '_sift-term-mu-' + str(siftValue)
                                    result = subprocess.run(
                                        ['tcksift', '-term_mu', str(siftValue), 'tracks_' + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + '.tck', 'wmfod_norm.mif', 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'], stdout=subprocess.PIPE)
                                    print(result.stdout.decode('utf-8'))

                                if (siftType=='term_ratio'):
                                    siftTerminus = '_sift-term-ratio-' + str(siftValue)
                                    result = subprocess.run(
                                        ['tcksift', '-term_ratio', str(siftValue), 'tracks_' + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + '.tck', 'wmfod_norm.mif', 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'], stdout=subprocess.PIPE)
                                    print(result.stdout.decode('utf-8'))

                                print('Sift done!!!')
        quantityFlag -= 1

        print("------------------------------------------------------------------------------------------------------\n")

    print("#####################################################################################################")

    #Comment!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #'''

messagebox.showinfo("ROI demand", "Please make and save your ROIs and click on OK.\nIf you do not want to make them now, click on OK and ignore the script errors.")

print("\n\n#####################################################################################################")
print("\nFiltering with ROIs:")
print("\n######################################################################################################")

#Choose folder with data - If all ROIs are already made, just click on Ok


if (onlyROIFiltering or performSiftOnly):
    message = messagebox.showinfo("Choice of ready output folder", "Choose the output folder already containing the data of all " + str(quantityOfMice) + " subjects to be processed...")
    newOutputPath = filedialog.askdirectory(initialdir=workPath)

else:
    newOutputPath = outputPath + '/' + newOutputFolderName

#--------------------------------------------------------------------------------------------------------------------------------
#Create output folder vector for each mouse
#Create output folders for each mouse
individualFolderNameVector=[]
quantityFlag=quantityOfMice
while (quantityFlag > 0):
    individualFolderNameVector.append('Mouse-' + str(quantityOfMice-quantityFlag+1))
    quantityFlag -= 1

print("\n\n#####################################################################################################")
print("\n\nOutput folders for each mouse:")
print("\n######################################################################################################")
os.chdir(newOutputPath)
proc = subprocess.run(['ls'])

# --------------------------------------------------------------------------------------------------------------------------------

for regionSelected in whichROI:

    os.chdir(newOutputPath)
    f = open("Results" + "_" + regionSelected + ".txt","w+")
    f.write("Compilation of results\r\n")


    quantityFlag = quantityOfMice

    while (quantityFlag > 0):
        f.write("\n%s\r\n" % (individualFolderNameVector[quantityOfMice-quantityFlag]))
        f.write("tractAlgo numSeeds cutoff stepSize count mean median std min max\r\n")

        os.chdir(newOutputPath + '/' + individualFolderNameVector[quantityOfMice-quantityFlag])

        print("\n------------------------------------------------------------------------------------------------------")
        print(individualFolderNameVector[quantityOfMice-quantityFlag])
        print("------------------------------------------------------------------------------------------------------")

        for tractAlgo in tractAlgoVector:
            for numberOfStreamLines in numberOfStreamlineVector:
                for cutoff in cutoffVector:
                    for stepSize in stepSizeVector:
                        angle = round(math.degrees(2 * math.asin(stepSize / (2 * curvature))), 4)

                        strCutoff = ('%.4f' % cutoff)

                        if (regionSelected=='ac' and not(onlyStatistics)):
                            print('Analysis of the anterior commissure')
                            result = subprocess.run(['tckedit','-include','ROI-ac_1_and.mif','-include','ROI-ac_2_and.mif', '-exclude', 'ROI-ac_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','ac_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='fr' and not(onlyStatistics)):
                            print('Analysis of the fasciculus retroflexus')
                            result = subprocess.run(['tckedit', '-include', 'ROI-fr_1_and.mif','-include', 'ROI-fr_2_and.mif','-exclude', 'ROI-fr_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','fr_' + tractAlgo + '_'  + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='cc' and not(onlyStatistics)):
                            print('Analysis of the corpus callosum')
                            result = subprocess.run(['tckedit', '-include', 'ROI-cc_1_and.mif','-include', 'ROI-cc_2_and.mif', '-exclude', 'ROI-cc_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','cc_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='f' and not(onlyStatistics)):
                            print('Analysis of the fornix')
                            result = subprocess.run(['tckedit', '-include', 'ROI-f_1_and.mif','-include', 'ROI-f_2_and.mif','-exclude', 'ROI-f_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','f_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='st' and not(onlyStatistics)):
                            print('Analysis of the stria terminalis')
                            result = subprocess.run(['tckedit', '-include', 'ROI-st_1_and.mif','-include', 'ROI-st_2_and.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','st_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))


                        elif (regionSelected=='sm' and not(onlyStatistics)):
                            print('Analysis of the stria medularis')
                            result = subprocess.run(['tckedit', '-include', 'ROI-sm_1_and.mif','-include', 'ROI-sm_2_and.mif','-exclude', 'ROI-sm_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','sm_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='vhc' and not(onlyStatistics)):
                            print('Analysis of the ventricle hippocampal commissure')
                            result = subprocess.run(['tckedit', '-include', 'ROI-vhc_1_and.mif','-include', 'ROI-vhc_2_and.mif','-exclude', 'ROI-vhc_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','vhc_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        # Change - 2020.03.12 - Copy parameter file to the output directory
                        elif (regionSelected=='ic' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-ic_1_and.mif','-include', 'ROI-ic_2_and.mif','-exclude', 'ROI-ic_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','ic_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        #elif (regionSelected=='cpL' and not(onlyStatistics)):
                            #print('Analysis of the internal capsule')
                            #result = subprocess.run(['tckedit', '-include', 'ROI-cpL_1_and.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','cpL_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            #print(result.stdout.decode('utf-8'))

                        #elif (regionSelected=='cpR' and not(onlyStatistics)):
                            #print('Analysis of the internal capsule')
                            #result = subprocess.run(['tckedit', '-include', 'ROI-cpR_1_and.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','cpR_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            #print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='frL' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-frL_1_and.mif', '-include', 'ROI-frL_2_and.mif', '-exclude', 'ROI-frL_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','frL_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='frR' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-frR_1_and.mif', '-include', 'ROI-frR_2_and.mif', '-exclude', 'ROI-frR_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','frR_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='icL-cpL' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-icL_and.mif','-include', 'ROI-cpL_and.mif','-exclude', 'ROI-icL-cpL_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','icL-cpL_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='icR-cpR' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-icR_and.mif','-include', 'ROI-cpR_and.mif','-exclude', 'ROI-icR-cpR_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','icR-cpR_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='smL' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-smL_1_and.mif','-include', 'ROI-smL_2_and.mif','-exclude', 'ROI-smL_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','smL_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='smR' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-smR_1_and.mif','-include', 'ROI-smR_2_and.mif','-exclude', 'ROI-smR_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','smR_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='stL' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-stL_1_and.mif','-include', 'ROI-stL_2_and.mif','-exclude', 'ROI-stL_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','stL_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))

                        elif (regionSelected=='stR' and not(onlyStatistics)):
                            print('Analysis of the internal capsule')
                            result = subprocess.run(['tckedit', '-include', 'ROI-stR_1_and.mif','-include', 'ROI-stR_2_and.mif','-exclude', 'ROI-stR_3_not.mif','tracks_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck','stR_'  + tractAlgo + '_' + str(numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads),'-force'], stdout=subprocess.PIPE)
                            print(result.stdout.decode('utf-8'))
                        # Change - 2020.03.12 - Copy parameter file to the output directory

                        result = subprocess.run(['tckstats', '-output', 'count', regionSelected + '_'  + tractAlgo + '_' + str(
                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                            stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                        countAC = result.stdout.decode('utf-8')

                        result = subprocess.run(['tckstats', '-output', 'mean', regionSelected + '_'  + tractAlgo + '_' + str(
                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                            stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                        meanAC = result.stdout.decode('utf-8')

                        result = subprocess.run(['tckstats', '-output', 'median', regionSelected + '_' + tractAlgo + '_'  + str(
                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                            stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                        medianAC = result.stdout.decode('utf-8')

                        result = subprocess.run(['tckstats', '-output', 'std', regionSelected + '_'  + tractAlgo + '_' + str(
                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                            stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                        stdAC = result.stdout.decode('utf-8')

                        result = subprocess.run(['tckstats', '-output', 'min', regionSelected + '_'  + tractAlgo + '_' + str(
                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                            stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                        minAC = result.stdout.decode('utf-8')

                        result = subprocess.run(['tckstats', '-output', 'max', regionSelected + '_'  + tractAlgo + '_' + str(
                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                            stepSize) + '_angle-' + str(angle) + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                        maxAC = result.stdout.decode('utf-8')

                        # f.write("%s %s %s %s %s %s %s %s %s\r\n" % (numberOfStreamLines,cutoff,stepSize,countAC,meanAC,medianAC,stdAC,minAC,maxAC))
                        results = ( tractAlgo + ' ' + str(numberOfStreamLines) + ' ' + strCutoff + ' ' + str(
                            stepSize) + ' ' + countAC + ' ' + meanAC + ' ' + medianAC + ' ' + stdAC + ' ' + minAC + ' ' + maxAC)
                        results = results.replace('\n', ' ')
                        f.write(results + '\r\n')

        quantityFlag -= 1

        print("------------------------------------------------------------------------------------------------------\n")

    f.close()


    print("#####################################################################################################")



for regionSelected in whichROI:
    firstTimeSiftStandardFlag = 0
    for siftType in siftTypeArray:
        for siftValue in siftValueArray:

            if (siftType == 'standard'):
                siftTerminus = '_sift-standard'

            if (siftType == 'term_mu'):
                siftTerminus = '_sift-term-mu-' + str(siftValue)

            if (siftType == 'term_ratio'):
                siftTerminus = '_sift-term-ratio-' + str(siftValue)

            os.chdir(newOutputPath)


            fSift = open("Results" + siftTerminus + "_" + regionSelected + ".txt", "w+")
            fSift.write("Compilation of results after sift\r\n")

            quantityFlag = quantityOfMice

            while (quantityFlag > 0):
                fSift.write("\n%s\r\n" % (individualFolderNameVector[quantityOfMice - quantityFlag]))
                fSift.write("No-of-streamlines Cutoff Step-size Count Mean Median Std Min Max\r\n")

                os.chdir(newOutputPath + '/' + individualFolderNameVector[quantityOfMice - quantityFlag])

                print(
                    "\n------------------------------------------------------------------------------------------------------")
                print(individualFolderNameVector[quantityOfMice - quantityFlag])
                print("------------------------------------------------------------------------------------------------------")


                for numberOfStreamLines in numberOfStreamlineVector:
                    for cutoff in cutoffVector:
                        for stepSize in stepSizeVector:
                            angle = round(math.degrees(2 * math.asin(stepSize / (2 * curvature))), 4)

                            strCutoff = ('%.4f' % cutoff)

                            if (performSiftOnly):
                                print('Sift type: %s\r\n' % siftTerminus)
                                print('Sift value: %f\r\n' % siftValue)

                                if ((siftType == 'standard') and (not(firstTimeSiftStandardFlag))):
                                    print('Performing sift...\r\n')
                                    result = subprocess.run(
                                        ['tcksift', 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + '.tck', 'wmfod_norm.mif', 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                        stdout=subprocess.PIPE)
                                    print(result.stdout.decode('utf-8'))

                                #if ((siftType == 'term_mu') and (not(firstTimeFlag))):
                                if (siftType == 'term_mu'):
                                    print('Performing sift...\r\n')
                                    result = subprocess.run(
                                        ['tcksift', '-term_mu', str(siftValue), 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + '.tck', 'wmfod_norm.mif',
                                         'tracks_'  + tractAlgo + '_' + str(
                                             numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                             stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                        stdout=subprocess.PIPE)
                                    print(result.stdout.decode('utf-8'))

                                #if ((siftType == 'term_ratio') and (not(firstTimeFlag))):
                                if (siftType == 'term_ratio'):
                                    print('Performing sift...\r\n')
                                    result = subprocess.run(
                                        ['tcksift', '-term_ratio', str(siftValue), 'tracks_'  + tractAlgo + '_' + str(
                                            numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                            stepSize) + '_angle-' + str(angle) + '.tck', 'wmfod_norm.mif',
                                         'tracks_'  + tractAlgo + '_' + str(
                                             numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                             stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                        stdout=subprocess.PIPE)
                                    print(result.stdout.decode('utf-8'))
                                print('Sift done!!!')


                            if (regionSelected == 'ac' and not (onlyStatistics)):
                                print('Analysis of the anterior commissure after sift')
                                result = subprocess.run(
                                    ['tckedit', '-include', 'ROI-ac_1_and.mif', '-include', 'ROI-ac_2_and.mif', '-exclude', 'ROI-ac_3_not.mif', 'tracks_' + tractAlgo + '_'  + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', 'ac_' + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                    stdout=subprocess.PIPE)
                                print(result.stdout.decode('utf-8'))


                            elif (regionSelected == 'fr' and not (onlyStatistics)):
                                print('Analysis of the fasciculus retroflexus after sift')
                                result = subprocess.run(
                                    ['tckedit', '-include', 'ROI-fr_1_and.mif', '-include', 'ROI-fr_2_and.mif', '-exclude',
                                     'ROI-fr_3_not.mif', 'tracks_'  + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', 'fr_' + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                    stdout=subprocess.PIPE)
                                print(result.stdout.decode('utf-8'))


                            elif (regionSelected == 'cc' and not (onlyStatistics)):
                                print('Analysis of the corpus callosum after sift')
                                result = subprocess.run(
                                    ['tckedit', '-include', 'ROI-cc_1_and.mif', '-include', 'ROI-cc_2_and.mif', 'tracks_'  + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', 'cc_' + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                    stdout=subprocess.PIPE)
                                print(result.stdout.decode('utf-8'))


                            elif (regionSelected == 'f' and not (onlyStatistics)):
                                print('Analysis of the fornix after sift')
                                result = subprocess.run(
                                    ['tckedit', '-include', 'ROI-f_1_and.mif', '-include', 'ROI-f_2_and.mif', '-exclude',
                                     'ROI-f_3_not.mif', 'tracks_'  + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', 'f_' + tractAlgo + '_' + str(
                                        numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                        stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads), '-force'],
                                    stdout=subprocess.PIPE)
                                print(result.stdout.decode('utf-8'))

                            result = subprocess.run(['tckstats', '-output', 'count', regionSelected + '_' + tractAlgo + '_' + str(
                                numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            countACSift = result.stdout.decode('utf-8')

                            result = subprocess.run(['tckstats', '-output', 'mean', regionSelected + '_' + tractAlgo + '_' + str(
                                numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            meanACSift = result.stdout.decode('utf-8')

                            result = subprocess.run(['tckstats', '-output', 'median', regionSelected + '_' + tractAlgo + '_' + str(
                                numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            medianACSift = result.stdout.decode('utf-8')

                            result = subprocess.run(['tckstats', '-output', 'std', regionSelected + '_' + tractAlgo + '_' + str(
                                numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            stdACSift = result.stdout.decode('utf-8')

                            result = subprocess.run(['tckstats', '-output', 'min', regionSelected + '_' + tractAlgo + '_' + str(
                                numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            minACSift = result.stdout.decode('utf-8')

                            result = subprocess.run(['tckstats', '-output', 'max', regionSelected + '_' + tractAlgo + '_' + str(
                                numberOfStreamLines) + '_cutoff-' + strCutoff + '_minl-0.1_maxl-50' + '_step-' + str(
                                stepSize) + '_angle-' + str(angle) + siftTerminus + '.tck', '-nthreads', str(nThreads)], stdout=subprocess.PIPE)
                            maxACSift = result.stdout.decode('utf-8')

                            resultsSift = (tractAlgo + ' ' + str(numberOfStreamLines) + ' ' + strCutoff + ' ' + str(
                                stepSize) + ' ' + countACSift + ' ' + meanACSift + ' ' + medianACSift + ' ' + stdACSift + ' ' + minACSift + ' ' + maxACSift)
                            resultsSift = resultsSift.replace('\n', ' ')
                            fSift.write(resultsSift + '\r\n')



                quantityFlag -= 1
                print("------------------------------------------------------------------------------------------------------\n")
            firstTimeSiftStandardFlag = 1



            fSift.close()

print("#####################################################################################################")



