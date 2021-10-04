.PHONY: gettxt
gettxt: thesis/thesis.pdf
	pdftotext -H 770 -W 1000 $^