TEX=pdflatex
FILE=notes
INDX=makeindex

all:
	$(TEX) $(FILE)
index:
	$(TEX) $(FILE)
	$(INDX) $(FILE)
	$(TEX) $(FILE)
bib:
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)