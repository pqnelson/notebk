TEX=pdflatex
FILE=blog
IMG_FILES = $(shell cd img && ls *.mp)

all: img contents
	$(TEX) $(FILE)

contents:
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)

.PHONY: img $(IMG_FILES)
img: $(IMG_FILES)

$(IMG_FILES):
	cd img && mpost $@
