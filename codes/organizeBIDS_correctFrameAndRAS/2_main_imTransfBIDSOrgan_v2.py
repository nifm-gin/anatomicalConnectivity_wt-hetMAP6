# -*- coding: utf-8 -*

import os
import subprocess
import math
import datetime


commandOutput = subprocess.run(['reset'], stdout=subprocess.PIPE)
print("\n\n##########################################################################################################################")
print("\n\nScript to prepare rs-fMRI data in BIDS and transform images to RAS format - Coded by Diego ALVES RODRIGUES DE SOUZA")
print("\n\n##########################################################################################################################")


print("\n\n################################################### \nStep 0: Define options and paths \n###################################################\n")


# T1 FLASH and 3D DTI acquisition ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#txtDocImagePathFeatures = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/datasets/20181210_originalData_manipDTI_wt-hetMAP6Mice/allSubjects/t1FLASH-zeroTransformDTI/20230522_231347_listOfSubjectsAndImages_v1.txt"
#sessionNumber = 1
#outputDir = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/datasets/20181210_dataOrgBIDS_manipDTI_wt-hetMAP6Mice/allSubjects"

txtDocImagePathFeatures = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/datasets/20181210_originalData_manipDTI_wt-hetMAP6Mice/allSubjects/t1FLASH-zeroTransformDTI_shorterNames/20230526_170416_listOfSubjectsAndImages_v1.txt"
sessionNumber = 1
outputDir = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/datasets/20181210_dataOrgBIDS_manipDTI_wt-hetMAP6Mice/allSubjects_shorterNames"


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




mrtransformTxtFilePath_boldDTI = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/codes/organizeBIDS_correctFrameAndRAS/linearTransform_3dDTI.txt"
mrtransformTxtFilePath_anat = "/data_network/summer_projects/alvesrod/Share/2023_mouse-dMRI/codes/organizeBIDS_correctFrameAndRAS/linearTransform_t1FLASH.txt"


txtDocStruct = ["subjectNameBIDS","anat","func"] #It must match to the data in the txt doc (name of the subject at the first column and BIDS convention for the type of images)
imagePrefix = ["T2w", "bold"] #Prefix to be added according to the type of images in the list (it is mandatory for the recognition of image type by RABIES during the preprocessing)

nB0Extract = 1
nRepeatExtrB0 = 5

debugMode = 1

print("\n\n###################################################\n")



print("\n\n################################################### \nStep 1: Read txt doc and organize data \n###################################################\n")
with open(txtDocImagePathFeatures) as linesTxtDoc:
    linesTxtDoc = linesTxtDoc.readlines()

    
subjectData = ["" for x in range(len(linesTxtDoc))]

for lineNumber in range(len(linesTxtDoc)):
    print(lineNumber)
    subjectData[lineNumber] = linesTxtDoc[lineNumber].split(";")
    subjectData[lineNumber][-1] = subjectData[lineNumber][-1].replace("\n","")

print("\n\nWhole subject data:")
print(subjectData)



if debugMode==1:
    print("\n\nDebug (list of images) -------------------------------------------------------------------------------")    

    for n in range(len(subjectData)):
        print("\nsubjectData[{:d}]".format(n))
        print(subjectData[n])
        for m in range(len(subjectData[0])):
            print("subjectData[{:d},{:d}]".format(n, m))
            print(subjectData[n][m])

    print("------------------------------------------------------------------------------------------")

    
#Check data consistency
if len(subjectData[0]) != len(txtDocStruct):
    print("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \nInput data and its expected structure are not coherent!!! \n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
else:
    print("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \nInput data consistency check: OK. \n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
    
print("\n\n###################################################\n")




print("\n\n################################################### \nStep 2: Make BIDS folders, transform images and apply RAS convention \n###################################################\n")
if (txtDocStruct[0]=="subjectNameBIDS"):
    
    now = datetime.datetime.now()                    

    workingDir = outputDir + "/" + now.strftime("%Y%m%d_%H%M%S_dataOrgBIDS") #If the persons writes a "/" or not at the end of "outputDir", it will work
    commandOutput = subprocess.run(["mkdir", workingDir], stdout=subprocess.PIPE)

    os.chdir(workingDir)

    commandOutput = subprocess.run(["ls"], stdout=subprocess.PIPE)        
    print(commandOutput.stdout.decode('utf-8'))
    

    for subjectNumber in range(len(subjectData)):
        print("\n***********************************************************************************************")
        print("Subject: {:s}".format(subjectData[subjectNumber][0]))

        print("Make main folder inside output directory for subject No {:d}...".format(subjectNumber))

        commandOutput = subprocess.run(["mkdir", "sub-" + (subjectData[subjectNumber][0])], stdout=subprocess.PIPE)
        commandOutput = subprocess.run(["ls"], stdout=subprocess.PIPE)
        print(commandOutput.stdout.decode('utf-8'))
        
        print("Subject folder made.")
           
        commandOutput = subprocess.run(["mkdir", workingDir + "/" + "sub-" + subjectData[subjectNumber][0] + "/ses-" + str(sessionNumber) ], stdout=subprocess.PIPE)
        print("Session folder made.")


        for imageSeq in range(len(subjectData[0])-1): #Subject name in position 0 is not taken into account
            print("\n-----------------------------------------------------------------------")
            print("\nCreating folder and converting '{:s}' image of subject '{:s}' (No {:d})...".format(txtDocStruct[imageSeq+1],subjectData[subjectNumber][0],subjectNumber))    
            
            imageDir = workingDir + "/" + "sub-" + subjectData[subjectNumber][0] + "/ses-" + str(sessionNumber) + "/" + txtDocStruct[imageSeq+1]
            print(imageDir)
            commandOutput = subprocess.run(["mkdir", imageDir], stdout=subprocess.PIPE)
            commandOutput = subprocess.run(["ls",imageDir], stdout=subprocess.PIPE)                                           
            print(commandOutput.stdout.decode('utf-8'))

            
            print("Input image: ")
            print(subjectData[subjectNumber][imageSeq+1])

            inputImagePathName, inputImageExt = os.path.splitext(subjectData[subjectNumber][imageSeq+1])            
            print("Output image:")
            #print(imageDir + "/" + inputImageName)
            print(inputImagePathName)

            if imageSeq==0:
                print("Applying transformation and RAS convention on anatomical image...")
                commandOutput = subprocess.run(["mrtransform", "-linear", mrtransformTxtFilePath_anat, subjectData[subjectNumber][imageSeq+1], (inputImagePathName + "_mrLinTrans" + inputImageExt), "-force"], stdout=subprocess.PIPE)
                commandOutput = subprocess.run(["fslswapdim", (inputImagePathName + "_mrLinTrans" + inputImageExt), "x", "z", "-y", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_" + imagePrefix[imageSeq] + inputImageExt)], stdout=subprocess.PIPE)
                print(commandOutput.stdout.decode('utf-8'))            
                commandOutput = subprocess.run(["cp", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), imageDir], stdout=subprocess.PIPE)
                print("Done!!!")

            if imageSeq==1:
                print("Applying transformation and RAS convention on bold or DTI  image...")
                commandOutput = subprocess.run(["mrtransform", "-linear", mrtransformTxtFilePath_boldDTI, subjectData[subjectNumber][imageSeq+1], (inputImagePathName + "_mrLinTrans" + inputImageExt), "-force"], stdout=subprocess.PIPE)
                commandOutput = subprocess.run(["fslswapdim", (inputImagePathName + "_mrLinTrans" + inputImageExt), "-x", "-y", "z", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_" + imagePrefix[imageSeq] + inputImageExt)], stdout=subprocess.PIPE)
                print(commandOutput.stdout.decode('utf-8'))

                if (nB0Extract > 0):
                    commandOutput = subprocess.run(["mrconvert", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), "-coord","3", "0:1:" + str(nB0Extract-1),"-axes","0,1,2", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_" + imagePrefix[imageSeq] + inputImageExt + ".gz") ], stdout=subprocess.PIPE)
                    print(commandOutput.stdout.decode('utf-8'))

                    if (nRepeatExtrB0 > 1):
                        commandOutput = subprocess.run(["mrcat", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_nRepB0-2_" + imagePrefix[imageSeq] + inputImageExt + ".gz") ], stdout=subprocess.PIPE)                        
                        
                        for indexRep in range (nRepeatExtrB0-2):
                            commandOutput = subprocess.run(["mrcat", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_nRepB0-" + str(indexRep+2)  + "_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_nRepB0-" + str(indexRep+3)  + "_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), "-force" ], stdout=subprocess.PIPE)
                            print(commandOutput.stdout.decode('utf-8'))

                        commandOutput = subprocess.run(["cp", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_nRepB0-" + str(nRepeatExtrB0)  + "_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), imageDir], stdout=subprocess.PIPE)

                    else:
                        commandOutput = subprocess.run(["cp", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_b0s_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), imageDir], stdout=subprocess.PIPE)
                    
                else:
                    commandOutput = subprocess.run(["cp", (inputImagePathName + "_mrLinTrans_fslSwapDim-RAS_" + imagePrefix[imageSeq] + inputImageExt + ".gz"), imageDir], stdout=subprocess.PIPE)
                
                print("Done!!!")

            print("\n-----------------------------------------------------------------------")
                

        print("Image transformation and RAS convention were succefully applied.")            
        
            
        print("\n***********************************************************************************************")
        print("Images of subject {:s} are ready.".format(subjectData[subjectNumber][0]))

else:
    print("Error: First column of the txt doc is not the name of the subject. Please, correct it and try again!!!")
print("\n\n###################################################\n")

