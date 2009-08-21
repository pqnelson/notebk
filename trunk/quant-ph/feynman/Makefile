FILE=feynman
LATEX=pdflatex
all:
	$(LATEX) $(FILE) 
	bibtex $(FILE) 
	$(LATEX) $(FILE) 
	$(LATEX) $(FILE) 
	rm $(FILE).aux $(FILE).blg $(FILE).bbl $(FILE).out
	rm $(FILE).log 
	rm *.mp

img:
	$(LATEX) $(FILE) 
	bibtex $(FILE) 
	bash -c 'for a in *.mp; do mpost $$a; done'
	$(LATEX) $(FILE) 
	$(LATEX) $(FILE) 
	rm *.log
	rm $(FILE).aux $(FILE).blg $(FILE).bbl $(FILE).out
	rm *.mp
	rm *.t1
clean:
	rm *.log
	rm $(FILE).aux $(FILE).blg $(FILE).bbl $(FILE).out
	rm *.mp
	rm *.t1
