TEX=tex
FILE=notes-plain
DVIPDF=dvipdfmx
LATEX=latex
LAFILE=notes-ltx

all: plainTeX latex

plainTeX:
	$(TEX) $(FILE)
	$(DVIPDF) $(FILE).dvi

latex:
	$(LATEX) $(LAFILE)
	$(LATEX) $(LAFILE)
	$(DVIPDF) $(LAFILE).dvi