TEX=pdflatex
POST=mpost
DOODLES=img
FILE=spinnet
BIB=bibtex

all:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	rm $(FILE).log $(FILE).aux $(FILE).blg $(FILE).bbl $(FILE).out
img:
	$(POST) $(DOODLES).mp
	rm $(DOODLES).log $(DOODLES).mpx
