default: root.pdf ;

diags: diagrams
	if [ ! -d diags ];\
		then mkdir diags;\
	fi
	for diagram in `ls diagrams/ --ignore-backups | sed 's/\.dia//g'`;\
		do dia "diagrams/$$diagram".dia -e $@/"$$diagram".png;\
	done

root.pdf: pictures diags root.tex
	pdflatex root.tex

clean:
	rm -r diags root.{aux,fdb_latexmk,fls,log,pdf,pyg,toc}
