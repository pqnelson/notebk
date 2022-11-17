TEX=pdflatex
FILE=notes

all: images
	$(TEX) $(FILE)
bib:
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)

images:
	cd img && mpost img.mp