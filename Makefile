TIKZ_NAMES := chapters/07/figures/RIB/RIB_diagram \
							chapters/07/figures/REB/SoI_Rectangular \
							chapters/07/figures/REB/Expansion	\
							chapters/07/figures/alignmentComparison/pac_axial	\
							chapters/07/figures/alignmentComparison/pac_radial	\
							chapters/07/figures/alignmentComparison/pac_general

dissertation.pdf: main.tex TIKZ_FIGURES
	latexmk -pdf -cd main.tex -jobname=output/dissertation

TIKZ_FIGURES:
	for figname in $(TIKZ_NAMES); do 					\
		dir=$$(dirname $$figname); 							\
		fig=$$(basename $$figname);							\
		cd $$dir;																\
		pdflatex -shell-escape ./$$fig.tex;			\
		cd -;																		\
	done

clean:
	rm -rf output/*;									\
	for figname in $(TIKZ_NAMES); do 	\
		rm -f $$figname.pdf;								\
		rm -f *.log *.aux *.fdb_latexmk *.fls *.gnuplot *.table;	\
	done