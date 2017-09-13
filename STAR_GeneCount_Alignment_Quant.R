# Process the scRNA seq data using STAR/Gene Count
# Can get raw integer counts
# Can then use in DESeq2 for DEG, Seurat, SCDE etc - since they all do internal normalization
#
# Output written to the basedir/subdir (sample name) from which STAR is run
#
baseSTARresultsDir = "/DATA1/agarw005/projects/scTCR_RNAseq_PD1/STAR/"
baseSTARdir = paste0(baseSTARresultsDir,"GeneCounts/output_Plate1Plate2_060517/");
setwd(baseSTARdir); # STAR output results to the working dir
getwd();
#
#Fastq file (TRIMMED)
fastqdirPD1 = "/DATA1/agarw005/projects/scTCR_RNAseq_PD1/data/CombinedPlate1Plate2/";
#
fqfiles = list.files(paste0(fastqdirPD1), recursive = FALSE, full.names = FALSE, pattern="R1.fq.gz");
#
#
######################
# Build STAR command
######################
cmdSTAR1 = "/DATA1/installs/STAR/STAR_BIN --runThreadN 12";
cmdSTAR2 = "--genomeDir /DATA1/installs/STAR/STAR_2.5.2b_INDEX/GRCh38.79_SpliceJunc_99/";
cmdSTAR3 = "--sjdbGTFfile /DATA1/installs/STAR/STAR_2.5.2b_INDEX/GRCh38.79_SpliceJunc/Homo_sapiens.GRCh38.79.gtf";
cmdSTAR4 = "--sjdbOverhang 99";
cmdSTAR5 = "--outSAMtype None";
cmdSTAR6 = "--readFilesCommand zcat";
cmdSTAR9 = "--quantMode GeneCounts";
#
# PD1 - all
#
for(file in fqfiles){
   sample = substr(file, 1, nchar(file)-9)
   print(sample);
   fqfile1 = paste0(fastqdirPD1, sample, "_R1.fq.gz");
   fqfile2 = paste0(fastqdirPD1, sample, "_R2.fq.gz");
   cmdSTAR7= paste0("--readFilesIn ",fqfile1, " ", fqfile2);
   cmdSTAR8= paste0("--outFileNamePrefix ", sample);
   cmdSTAR = paste(cmdSTAR1, cmdSTAR2, cmdSTAR3, cmdSTAR4, cmdSTAR5, cmdSTAR6, cmdSTAR7, cmdSTAR8, cmdSTAR9);
   print(cmdSTAR);
   system(cmdSTAR);
}
#