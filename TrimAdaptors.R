### For Positive Cell only - for Negative ran on R terminal by copy and paste
#
#
fastqDirPositive = "/DATA1/agarw005/projects/scTCR_RNAseq_PD1/data/PLATE2/Positive/"
fastqDirPositiveTrimmed = "/DATA1/agarw005/projects/scTCR_RNAseq_PD1/data/PLATE2/TRIMMED/Positive/"
samplesPositive = list.dirs(fastqDirPositive, recursive = FALSE, full.names = FALSE)
samplesPositive
# TRIMMOMATICS
cmdTRIM1 = "java -jar /DATA1/installs/NGS_PreProcessing/Trimmomatic/bin/trimmomatic.jar PE"; # changed SE to PE
cmdTRIM2 = "-phred33";
cmdTRIM9 = "ILLUMINACLIP:/srv/agarw005/projects2/ImmuneSeq_SingleCell/hkl_singlecell_erpospd1posnegrnaseqtcrab_gd/src/nextera.fa:2:30:10:4:true";
cmdTRIM10 = "LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50";
#
for(sample in samplesPositive){
 print(sample);
 dirname = paste0(fastqDirPositive, sample)
 #print(dirname)
 readFastq = list.files(paste0(dirname, "/"), recursive = FALSE, full.names = FALSE)
 #print(class(readFastq))
 #print(readFastq)
 #print(readFastq[i])
 cmdTRIM3 = paste0(fastqDirPositive, sample, "/", readFastq[1]);
 cmdTRIM4 = paste0(fastqDirPositive, sample, "/", readFastq[2]);
 cmdTRIM5 = paste0(fastqDirPositiveTrimmed, "/paired_", readFastq[1]);
 cmdTRIM6 = paste0(fastqDirPositiveTrimmed, "/unpaired_", readFastq[1]);
 cmdTRIM7 = paste0(fastqDirPositiveTrimmed, "/paired_", readFastq[2]);
 cmdTRIM8 = paste0(fastqDirPositiveTrimmed, "/unpaired_", readFastq[2]);
 cmdTRIM = paste(cmdTRIM1, cmdTRIM2, cmdTRIM3, cmdTRIM4, cmdTRIM5, cmdTRIM6, cmdTRIM7, cmdTRIM8, cmdTRIM9, cmdTRIM10);
 print(cmdTRIM);
 system(cmdTRIM);
 }
}
print("DONE");
#