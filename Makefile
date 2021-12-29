.PHONY: examples english spanish

CC = latexmk

LATEX_FLAGS = -synctex=0 -interaction=nonstopmode -file-line-error -pdflua -shell-escape

FILES_DIR = files
ENGLISH_DIR = en
SPANISH_DIR = es

NAME = PabloForero
RESUME = Resume
COVERLETTER = CoverLetter
CV = CV
ENGLISH = EN
SPANISH = ES

all: $(foreach x, english spanish, $x)

english: $(foreach x, coverletter cv resume, $x-en)

spanish: $(foreach x, coverletter cv resume, $x-es)

resume-en: resume-en.tex
	$(CC) $(LATEX_FLAGS) -output-directory=$(FILES_DIR)/$(ENGLISH_DIR) -jobname=$(NAME)_$(RESUME)_$(ENGLISH) $<

cv-en: cv-en.tex
	$(CC) $(LATEX_FLAGS) -output-directory=$(FILES_DIR)/$(ENGLISH_DIR) -jobname=$(NAME)_$(CV)_$(ENGLISH) $<

coverletter-en: coverletter-en.tex
	$(CC) $(LATEX_FLAGS) -output-directory=$(FILES_DIR)/$(ENGLISH_DIR) -jobname=$(NAME)_$(COVERLETTER)_$(ENGLISH) $<

resume-es: resume-es.tex
	$(CC) $(LATEX_FLAGS) -output-directory=$(FILES_DIR)/$(SPANISH_DIR) -jobname=$(NAME)_$(RESUME)_$(SPANISH) $<

cv-es: cv-es.tex
	$(CC) $(LATEX_FLAGS) -output-directory=$(FILES_DIR)/$(SPANISH_DIR) -jobname=$(NAME)_$(CV)_$(SPANISH) $<

coverletter-es: coverletter-es.tex
	$(CC) $(LATEX_FLAGS) -output-directory=$(FILES_DIR)/$(SPANISH_DIR) -jobname=$(NAME)_$(COVERLETTER)_$(SPANISH) $<

clean:
	@rm -rf $(FILES_DIR)/$(ENGLISH_DIR)/*
	@rm -rf $(FILES_DIR)/$(SPANISH_DIR)/*