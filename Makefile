diags: diagrams
	if [ ! -d diags ];\
		then mkdir diags;\
	fi
	for diagram in `ls diagrams/ --ignore-backups`;\
		do dia "diagrams/$$diagram" -e $@/"$$diagram".png;\
	done

default: pictures diags root.tex
	pdflatex root.tex