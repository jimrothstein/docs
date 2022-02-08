# 5 SEPT 2020  - copies from ~/code/make_project
# 0100_print_pandoc.mk


# USAGE:
# ========
# make -f print_pandoc.mk target file1=<file1>  file2=<file2>

# variables
OUT=./output
FILES=./files
YML=./yml
SHELL :=/bin/zsh
#
# avoid confusion, should files exit with these names
.PHONY: all clean


# be sure pandoc  update
pandoc_version:
	pandoc -v
 

position:
	@echo $(info $(IN))
	@echo $(IN)

 
base_example:
	pandoc $i \
			-f markdown \
			-V linkcolor:blue \
			-V geometry:a4paper \
			-V geometry:margin=2cm \
			-V mainfont="DejaVu Serif" \
			-V monofont="DejaVu Sans Mono" \
			-o $o 

# =============
# NICER EXAMPLE:  TEX, header, xelatex 
# =============
# USAGE:  make -f <make_file> <target>   i=<input_file> o=<output_file>
#
# EXAMPLE
#	make -f  0010_print_pandoc.mk chapter_break i=files/sample_1.md   o=output/sample_1.pdf
#
#
chapter_break:
	pandoc $i \
			-f markdown \
			--include-in-header files/chapter_break.tex \
			-V linkcolor:blue \
			-V geometry:a4paper \
			-V geometry:margin=2cm \
			-V mainfont="DejaVu Serif" \
			-V monofont="DejaVu Sans Mono" \
			--pdf-engine=xelatex \
			-o $o 




# original in ~/code/make_project/0100....
#
# LEGACY CODE BELOW (for code examples)
#    Generates and prints directory listing
#		 
#
#

# ---------
#  LISTINGS
# ---------
#
#
ls_files:
	ls -la $(FILES)/

ls_output:
	ls -la $(OUT)/


# get listing
list_files:
	# file listing
	ls -la  > $(OUT)/listing.txt
	cat $(OUT)/listing.txt

list_files2:
	# file names ONLY
	ls -1FS > listing.txt
	

# ---------
# PDFs 
# ---------
convert_pdf: list_files2
# print ascii file, keep line breaks
	pandoc -f markdown+hard_line_breaks \
		-t latex \
		-o listing.pdf \
		listing.txt

# kluege:  pre- and post- yaml, ticks to trick pandoc .
ignore_markdown0:
	# WORKS
	pandoc $(SUPPORT)/yaml $(SUPPORT)/ticks.txt \
	~/code/r_try_things_here/088_env_namespace.R $(SUPPORT)/ticks.txt \
		-t latex \
		-o $(OUT)/listing.pdf 

ignore_markdown1:
	# BROKEN,
	# .R file (ascii) - ignore markown:
	cd ~/code/r_try_things_here
	pandoc $(SUPPORT)/yaml $(SUPPORT)/ticks.txt $(file1) $(SUPPORT)/ticks.txt \
		-t latex \
		-o listing.pdf 
	cd -


# TDO:   FAILS,  what is wrong with DIR?
ignore_markdown2:
# .R file (ascii) - ignore markown:
#
	DIR:="~/code/r_try_things_here/"
	@echo $(DIR)
	pandoc $(SUPPORT)/yaml $(SUPPORT)/ticks.txt  $(DIR)088_env_namespace.R \ 
		$(SUPPORT)/ticks.txt \
		-t latex \
		-o $(OUT)/listing.pdf 

view_pdf: convert_pdf
	zathura listing.pdf

# works
print_self:
	pandoc print_pandoc.mk -o out.pdf

# works
v2:
	pandoc $(file1) -o out.pdf

# works
v3:
	pandoc $(file1) -o $(file2).pdf

# BEGin here
#
Rmd:
	pandoc <Rmd> --f markdown -o <file.pdf>

#
#-----------------
# copy file to  print folder
#-----------------
copy:
	echo "$1"
	cp "$1" ~/Downloads/print_and_delete
	exit

rm_listing:
	# clean 
	rm listing.txt
	rm listing.pdf


