MAIN=rqm
TEX=pdflatex
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).out
	rm $(MAIN).log $(MAIN).toc
