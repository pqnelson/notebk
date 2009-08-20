TEX=latex
FILE=fourier
BIB=bibtex
INDEX=makeindex
SAGE=sage

all:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	$(INDEX) $(FILE)
	$(TEX) $(FILE)
	dvips $(FILE).dvi
	ps2pdf $(FILE).ps
	rm $(FILE).dvi

withsage:
	$(SAGE) $(FILE).sage
clean:
	rm $(FILE).bbl $(FILE).blg $(FILE).idx $(FILE).ilg $(FILE).ind $(FILE).lof $(FILE).log $(FILE).out $(FILE).py $(FILE).toc $(FILE).aux