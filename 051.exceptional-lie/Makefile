TEX=pdflatex
FILE=lie

all: img
	$(TEX) -draftmode $(FILE)
	$(TEX) $(FILE)
.PHONY: img
img:
	cd img && make
