# LaTeX document makefile
TEXFLAGS := -halt-on-error -file-line-error -src-specials -interaction=nonstopmode

default: FunctionalRefactoring.pdf

%.pdf: %.tex
	pdflatex $(TEXFLAGS) $<
	bibtex $(<:.tex=)
	pdflatex $(TEXFLAGS) $<
	pdflatex $(TEXFLAGS) $<
	rm -f $(<:.tex=.aux) $(<:.tex=.out) $(<:.tex=.log) $(<:.tex=.blg) $(<:.tex=.bbl) $(<:.tex=.brf) $(<:.tex=.toc)

%.pdf: %.eps
	epstopdf $<

%.pdf: %.svg
	inkscape --export-pdf=$@ $<

clean:
	rm -f FunctionalRefactoring.pdf
