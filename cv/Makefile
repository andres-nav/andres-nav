# Makefile for compiling LaTeX document with LuaTeX

# Set the name of your main .tex file (without the .tex extension)
DOCUMENT_NAME = main

# LuaTeX command
LUALATEX = lualatex

# PDF viewer command
PDFVIEWER = zathura

# Compilation flags
LATEXFLAGS = -interaction=nonstopmode

# Output directory
OUTPUT_DIR = en

.PHONY: all clean view

all: $(OUTPUT_DIR)/$(DOCUMENT_NAME).pdf

$(OUTPUT_DIR)/$(DOCUMENT_NAME).pdf: $(DOCUMENT_NAME).tex | $(OUTPUT_DIR)
	$(LUALATEX) $(LATEXFLAGS) -output-directory=$(OUTPUT_DIR) $<

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR) $(DOCUMENT_NAME).aux $(DOCUMENT_NAME).log $(DOCUMENT_NAME).out $(DOCUMENT_NAME).toc

view: $(OUTPUT_DIR)/$(DOCUMENT_NAME).pdf
	$(PDFVIEWER) $< &
