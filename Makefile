# LaTeX document makefile with support for syntax-highlighting code snippets
# with pygmentize and SVG figures.
TEXFLAGS := -halt-on-error -file-line-error -src-specials -interaction=nonstopmode
PYGMENTS_STYLE := colorful

LISTING_FILES := $(shell ls Listings/*.hs)
LISTINGS := $(LISTING_FILES:=.listing)

default: Haskell.pdf

Haskell.pdf: StyleDefs.tex $(LISTINGS)

%.pdf: %.tex
	pdflatex $(TEXFLAGS) $<
	bibtex $(<:.tex=)
	pdflatex $(TEXFLAGS) $<
	pdflatex $(TEXFLAGS) $<
	rm -f $(<:.tex=.aux) $(<:.tex=.out) $(<:.tex=.log) $(<:.tex=.blg) $(<:.tex=.bbl) $(<:.tex=.brf)

%.pdf: %.eps
	epstopdf $<

%.pdf: %.svg
	inkscape --export-pdf=$@ $<

%.listing: % Makefile
	pygmentize -f latex -O style=$(PYGMENTS_STYLE) $< > $@

StyleDefs.tex: Makefile
	pygmentize -f latex -S $(PYGMENTS_STYLE) > $@

clean:
	rm -f *~ $(LISTINGS)

