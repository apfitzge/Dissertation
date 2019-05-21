prospectus.pdf: main.tex
	latexmk -pdf -cd main.tex -jobname=output/prospectus

clean:
	rm -rf output/*