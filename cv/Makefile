# Makefile for compiling LaTeX document with LuaTeX

# Set the name of your main .tex file (without the .tex extension)
MAIN = CV

# LuaTeX command
LUALATEX = lualatex

# PDF viewer command
PDFVIEWER = zathura
PDFVIEWERFLAGS = --fork

# Compilation flags
LATEXFLAGS = -interaction=nonstopmode

# Language selection
LANGUAGE_EN = en
LANGUAGE_ES = es

# Default language (use environment variable if set, otherwise default to LANGUAGE_EN)
LANGUAGE ?= $(LANGUAGE_EN)

# Output directory
OUTPUT_DIR = $(LANGUAGE)

.PHONY: all en es view

all: mkdir main view

main: $(MAIN).tex | $(OUTPUT_DIR)
	$(LUALATEX) $(LATEXFLAGS) -output-directory=$(OUTPUT_DIR) -jobname=$(MAIN) "\def\mylang{$(LANGUAGE)}\input{$(MAIN)}"

mkdir:
	mkdir -p $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/$(MAIN).aux $(OUTPUT_DIR)/$(MAIN).log $(OUTPUT_DIR)/$(MAIN).out $(OUTPUT_DIR)/$(MAIN).toc

view:
	@if ! pgrep -af "$(PDFVIEWER) $(PDFVIEWERFLAGS) $(OUTPUT_DIR)/$(MAIN).pdf" > /dev/null; then $(PDFVIEWER) $(PDFVIEWERFLAGS) $(OUTPUT_DIR)/$(MAIN).pdf; fi
