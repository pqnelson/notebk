TEX=pdflatex
FILE=qg

all: images
	$(TEX) $(FILE)
	cd img && mpost feyngraph.mp
	rm img/feyngraph.mp
	$(TEX) $(FILE)

images:
	cd img && mpost img
