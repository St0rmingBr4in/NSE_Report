PDFLATEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
PDFLATEX = rubber -d

VIEWER    = zathura
DOC   ?= main

PDF   = $(DOC).pdf
TEX   = $(DOC).tex

all: $(PDF)

%.pdf: %.tex
	$(PDFLATEX) $<

view: $(PDF)
	$(VIEWER) $<

clean:
	$(RM) *.log *.aux *.pdf
