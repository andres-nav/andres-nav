# Makefile for compiling LaTeX document with LuaTeX

# Set the name of your main .tex file (without the .tex extension)
MAIN = CV

LATEX_CMD = latexmk

# PDF viewer command
PDF_VIEWER = zathura
PDF_VIEWER_FLAGS = --fork

# Compilation flags
# Use lualatex
LATEXFLAGS = -pdflua -interaction=nonstopmode

# Language selection
LANGUAGE_EN = en
LANGUAGE_ES = es

# Default language (use environment variable if set, otherwise default to LANGUAGE_EN)
LANGUAGE ?= $(LANGUAGE_EN)

# Directory
DIR = $(shell pwd)
OUTPUT_DIR = $(DIR)/../$(LANGUAGE)
TEMP_DIR = $(mktemp -d)

.PHONY: all en es view

all: mkdir main view

main: $(MAIN).tex | $(OUTPUT_DIR)
	SOURCE_DATE_EPOCH=$(date) $(LATEX_CMD) -aux-directory=$(TEMP_DIR) -outdir=$(OUTPUT_DIR) -jobname=$(MAIN) $(LATEXFLAGS) $(MAIN).tex

mkdir:
	mkdir -p $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/$(MAIN).aux $(OUTPUT_DIR)/$(MAIN).log $(OUTPUT_DIR)/$(MAIN).out $(OUTPUT_DIR)/$(MAIN).toc

view:
	@if ! pgrep -af "$(PDF_VIEWER) $(PDF_VIEWER_FLAGS) $(OUTPUT_DIR)/$(MAIN).pdf" > /dev/null; then $(PDF_VIEWER) $(PDF_VIEWER_FLAGS) $(OUTPUT_DIR)/$(MAIN).pdf; fi
