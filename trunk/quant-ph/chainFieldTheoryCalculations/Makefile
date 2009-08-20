MAIN=chain
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
