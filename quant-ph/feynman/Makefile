FILE=feynman
LATEX=pdflatex
all:
	$(LATEX) $(FILE) 
	bibtex $(FILE) 
	$(LATEX) $(FILE) 
	$(LATEX) $(FILE) 
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).out
	rm $(MAIN).log $(MAIN).toc

img:
	bash mpost.sh
	rm *.log
	rm *.mp
	rm *.t1
	rm *.t1
