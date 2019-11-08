TIKZ_NAMES := chapters/SpatialDecomposition/figures/RIB/RIB_diagram \
							chapters/SpatialDecomposition/figures/REB/SoI_Rectangular \
							chapters/SpatialDecomposition/figures/REB/Expansion	\
							chapters/SpatialDecomposition/figures/alignmentComparison/pac_axial	\
							chapters/SpatialDecomposition/figures/alignmentComparison/pac_radial	\
							chapters/SpatialDecomposition/figures/alignmentComparison/pac_general

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