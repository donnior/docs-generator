include_dir=build
target_dir=target
source=index.md
title='Document'
filename='document'


all: html rtf pdf word

html:
	pandoc -s $(source) -t html5 -o index.html -c style.css \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc

# epub:
# 	pandoc -s $(source) --normalize --smart -t epub -o $(filename).epub \
# 		--epub-metadata $(include_dir)/metadata.xml \
# 		--epub-stylesheet epub.css \
# 		--epub-cover-image img/cover.jpg \
# 		--title-prefix $(title) \
# 		--normalize \
# 		--smart \
# 		--toc

rtf:
	pandoc -s $(source) -o $(target_dir)/$(filename).rtf \
		--title-prefix $(title) \
		--normalize \
		--smart

pdf:
	pandoc -s $(source) -o $(target_dir)/$(filename).pdf --latex-engine=xelatex -V mainfont="STHeiti" \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc

word:
	pandoc -s -S $(source) -o $(target_dir)/$(filename).docx
