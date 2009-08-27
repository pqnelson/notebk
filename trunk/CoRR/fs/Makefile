MAIN=fs
TEX=pdflatex
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	rm $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc
	rm $(MAIN).bbl $(MAIN).blg