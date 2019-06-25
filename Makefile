BUILD := \
	poster \


DEPS := \
	beamerthemegemini.sty \
	beamercolorthemegemini.sty \
	beamercolorthemenyu.sty \
	beamercolorthemelabsix.sty \


LATEX  := lualatex
BIBTEX := bibtex

LATEXOPTS := -interaction nonstopmode

TARGETS := $(patsubst %, %.pdf, $(BUILD))

# phony targets

all: $(TARGETS)

clean:
	# rm -rf *.pdf *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc
	rm -rf *.pdf *.aux *.blg *.log *.nav *.out *.snm *.toc

.PHONY: all clean

# main targets

poster.pdf: poster.tex poster.bib $(DEPS)
	$(eval SRC_$@ = $(patsubst %.tex, %, $<))
	$(LATEX) $(LATEXOPTS) $(SRC_$@)
	$(BIBTEX) $(SRC_$@)
	$(LATEX) $(LATEXOPTS) $(SRC_$@)
	$(LATEX) $(LATEXOPTS) $(SRC_$@)
