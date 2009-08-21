MAIN=functionalQFT
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

diag:
	$(TEX) $(MAIN)
	mpost --output-directory=img img/feynmanDiags.mp
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).out
	rm $(MAIN).log $(MAIN).toc
	rm *.log
	rm *.mp
	rm *.t1
#	mpost *.mp
