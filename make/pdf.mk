pdfdestdir  := pdf
pdffile     := $(pdfdestdir)/cursus.pdf
wkhtmltopdf := /opt/wkhtmltox/bin/wkhtmltopdf

.PHONY: pdf
pdf: $(pdffile)

$(pdffile): $(shell find $(pubdir)/* -type f) | $(pdfdestdir) $(wkhtmltopdf)
	$(wkhtmltopdf) toc localhost:8000/cursus.html $@


$(pdfdestdir):
	mkdir -p $@
