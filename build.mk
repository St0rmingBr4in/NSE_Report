PANDOC		= pandoc
PDFLATEX	= texi2pdf

DOC		?= report

PDF		= $(DOC).pdf
TEX		= $(DOC).tex

DIR_TEMPLATE	?= ../../template
TEMPLATE_TEX	= $(DIR_TEMPLATE)/$(TEMPLATE).tex

SUB_TEX		= $(FILES:.md=.tex)

VARS		= -V lang=$(LANG)		\
		  -V title=$(TITLE)		\
		  -V subtitle=$(SUBTITLE)	\
		  -V author=$(AUTHOR)		\
		  -V date=$(DATE)		\
		  -V promo=$(PROMO)		\
		  -V logo=$(LOGO)		\
		  -V logoscale=$(LOGOSCALE)

TYPE		?= latex
VIEWER		= zathura

all: $(PDF)

$(TEX): $(FILES)
	$(PANDOC) -o $@ $(VARS) --template=$(TEMPLATE_TEX) -t $(TYPE) $^

view: $(PDF)
	$(VIEWER) $<

$(PDF): $(TEX)
	$(PDFLATEX) $(TEX)

clean:
	rm -rf $(TEX) *.html *.pdf *~ *.log *.aux *.toc *.out *.nav *.snm
