TEX=pdflatex
FILE=conformal
BIB=bibtex

all:
	$(TEX) $(FILE) 
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
clean:
	rm *.aux *.log *.bbl *.blg