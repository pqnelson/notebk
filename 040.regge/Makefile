TEX=pdflatex
FILE=regge

all: images
	$(TEX) $(FILE)
	cd img && mpost feyngraph.mp
	$(TEX) $(FILE)

images:
	cd img && mpost img.mp