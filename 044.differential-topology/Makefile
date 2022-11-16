TEX=pdflatex
FILE=dt

all: images
	$(TEX) $(FILE)
	$(TEX) $(FILE)

images:
	cd img && mpost -tex=latex -numbersystem=double img.mp