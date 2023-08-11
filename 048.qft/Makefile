TEX=pdflatex
FILE=qft

all: img
	$(TEX) $(FILE)
	makeindex $(FILE)
	$(TEX) $(FILE)

.PHONY: img
img:
	cd img && make