prospectus.pdf: main.tex
	latexmk -pdf -cd main.tex -jobname=output/dissertation

clean:
	rm -rf output/*