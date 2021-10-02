.PHONY: paper2text
paper2text: paper/paper.pdf
	pdftotext -H 770 -W 1000 $^