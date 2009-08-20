FILE=feynman

all:
	latex $(FILE) 
#	mpost *.mp
	bash mpost.sh
	bibtex $(FILE) 
	latex $(FILE) 
	latex $(FILE) 
	dvips $(FILE).dvi
	ps2pdf $(FILE).ps
#	rm *.dvi *.ps
