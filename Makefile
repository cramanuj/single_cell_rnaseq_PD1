.SUFFIXES: .tex .pdf .Rnw .R

MAIN = ssRNAseq
RNWINCLUDES = ssRNAseq 
TEX = $(RNWINCLUDES:=.tex)
RFILES = $(RNWINCLUDES:=.R)
RNWFILES = $(INCLUDES:=.Rnw)

all: $(MAIN).pdf
	 $(MAIN).pdf: $(TEX) $(MAIN).tex

R: $(RFILES)

.Rnw.R:
	    R CMD Stangle $<

.Rnw.tex:
		R CMD Sweave $<

.tex.pdf:
	    pdflatex $<
		pdflatex $<


clean:
	    rm -fv $(OUT_FILES)
		rm -fv $(CROP_FILES)
		rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
		rm -fv *.out *.bcf *blx.bib *.run.xml
		rm -fv *.fdb_latexmk *.fls
		rm -fv $(TEXFILE).pdf
							 
.PHONY: all clean
