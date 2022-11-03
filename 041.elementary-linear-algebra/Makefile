TEX=pdflatex
FILE=elementary-linear-algebra

all: images
	$(TEX) $(FILE)
	$(TEX) $(FILE)

images:
	cd img && mpost -tex=latex -numbersystem=double img.mp

clean:
	rm $(FILE).aux $(FILE).out $(FILE).toc
	rm ./tex/*.aux