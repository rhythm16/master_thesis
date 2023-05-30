PAPER = main
TEX = $(wildcard *.tex)
BIB = back/references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png figures/*.svg)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	echo $(FIGS)
	xelatex -shell-escape $(PAPER)
	bibtex $(PAPER)
	xelatex -shell-escape $(PAPER)
	xelatex -shell-escape $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc $(PAPER).pdf

