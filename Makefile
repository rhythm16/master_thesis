PAPER = main
TEX = $(wildcard *.tex)
BIB = back/references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png figures/*.svg)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) back/* front/* contents/* ntuthesis.cls
	echo $(FIGS)
	xelatex -shell-escape $(PAPER)
	bibtex $(PAPER)
	xelatex -shell-escape $(PAPER)
	xelatex -shell-escape $(PAPER)

clean:
	rm -rf *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc _minted-main $(PAPER).pdf

