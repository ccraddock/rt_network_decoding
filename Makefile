SHELL := /bin/bash
LATEX_PATH = /usr/local/texlive/2012/bin/x86_64-darwin

manuscript_submit_files = craddock_rt_network_body.tex craddock_rt_network_abstract.tex craddock_rt_network_article.tex \
    craddock_rt_network_frontmatter_submit.tex craddock_rt_network_endmatter.tex craddock_rt_network_bib.bib
	
manuscript_preprint_files = craddock_rt_network_body.tex craddock_rt_network_abstract.tex \
    craddock_rt_network_article_preprint.tex craddock_rt_network_frontmatter.tex \
	craddock_rt_network_endmatter.tex craddock_rt_network_bib.bib
	
manuscript_revision_marked_files = craddock_rt_network_body_revision_marked.tex craddock_rt_network_abstract_revision_marked.tex \
    craddock_rt_network_article_revision_marked.tex craddock_rt_network_frontmatter_submit_revision_marked.tex \
	craddock_rt_network_endmatter.tex craddock_rt_network_bib.bib
	
all: submit preprint 
	
submit: $(manuscript_submit_files)
	$(LATEX_PATH)/pdflatex craddock_rt_network_article
	$(LATEX_PATH)/bibtex craddock_rt_network_article
	$(LATEX_PATH)/pdflatex craddock_rt_network_article
	$(LATEX_PATH)/pdflatex craddock_rt_network_article

preprint: $(manuscript_preprint_files)
	$(LATEX_PATH)/pdflatex craddock_rt_network_article_preprint
	$(LATEX_PATH)/bibtex craddock_rt_network_article_preprint
	$(LATEX_PATH)/pdflatex craddock_rt_network_article_preprint
	$(LATEX_PATH)/pdflatex craddock_rt_network_article_preprint

letter: submission_letter.tex 
	$(LATEX_PATH)/pdflatex submission_letter
	$(LATEX_PATH)/pdflatex submission_letter
	$(LATEX_PATH)/pdflatex submission_letter

revision_marked: $(manuscript_revision_marked_files)
	$(LATEX_PATH)/pdflatex craddock_rt_network_article_revision_marked
	$(LATEX_PATH)/bibtex craddock_rt_network_article_revision_marked
	$(LATEX_PATH)/pdflatex craddock_rt_network_article_revision_marked
	$(LATEX_PATH)/pdflatex craddock_rt_network_article_revision_marked

response_letter: reviewer_response_letter.tex 
	$(LATEX_PATH)/pdflatex reviewer_response_letter
	$(LATEX_PATH)/pdflatex reviewer_response_letter
	$(LATEX_PATH)/pdflatex reviewer_response_letter
 
clean:
	rm -v *.aux *.bbl *.blg *.log

