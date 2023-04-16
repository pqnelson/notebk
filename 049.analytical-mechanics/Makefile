TEX=pdflatex
FILE=analytical-mechanics

all: img
	$(TEX) $(FILE)
	$(TEX) $(FILE)
.PHONY: img
img:
	cd img && mpost -tex=latex -numbersystem=double img.mp