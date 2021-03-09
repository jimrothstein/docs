##	make backup
##	~/Downloads/documents/makefile
##-----------------------
##	backup ~/Downloads/documents/
##	USAGE: make backup  
##-----------------------

#
#
.PHONY:   backup  list nothing

# variables
# syntax %-Y  print year, no padding
# %-^a;  print day-of-week, caps, no padding
#theDate	:=	$(zsh date +"%-^a-%-d%-^b%-Y")				# simple, no recurse - set once

theDate = $(date -I)  

theDate = "26JAN2021"
theDir 	:=	~/Downloads/toGoogle  
theFile	:= $(theDir)/backup_${theDate}.tar.gz
export theDate  
export theFile


nothing:
	@echo $(theDate)  
	@echo $(theFile)

backup: 
	@#	Something still wrong with date.... extra ???

	@echo $(theDate)
	tar -cvpzf ~/Downloads/toGoogle/documents_"${theDate}".tar.gz -X exclude_files.txt *

list:
	
	ls -la ~/Downloads/toGoogle/					# why ll doesn't work?

list_details:
	tar -tf ~/Downloads/toGoogle/

jim:
	tar -czf jim.tar.gz -X exclude_files.txt ~/Downloads/documents/* 

jim_details:
	tar -tf jim.tar.gz



