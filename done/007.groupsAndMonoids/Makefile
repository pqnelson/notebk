TEX=pdflatex
FILE=algebra
INDX=makeindex
BIB=bibtex
all:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	rm $(FILE).aux $(FILE).bbl $(FILE).blg $(FILE).lof $(FILE).log $(FILE).out $(FILE).toc
index:
	$(TEX) $(FILE)
	$(INDX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	rm $(FILE).aux $(FILE).bbl $(FILE).blg $(FILE).lof $(FILE).log $(FILE).out $(FILE).toc
