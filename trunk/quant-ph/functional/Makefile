MAIN=functionalQFT
TEX=latex
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	dvips $(MAIN).dvi
	ps2pdf $(MAIN).ps
	rm $(MAIN).dvi
diag:
	$(TEX) $(MAIN)
	mpost --output-directory=img img/feynmanDiags.mp
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	dvips $(MAIN).dvi
	ps2pdf $(MAIN).ps
	rm $(MAIN).dvi
#	mpost *.mp
