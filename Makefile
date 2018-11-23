TEX=/usr/bin/xelatex
PDFUNITE=/usr/bin/pdfunite

.PHONY: all cover motivational cv clean fullclean

all: cover.pdf motivational.pdf cv.pdf
	$(PDFUNITE) cover.pdf motivational.pdf cv.pdf bewerbung.pdf

cover.pdf: cover.tex variables.tex
	$(TEX) $<

motivational.pdf: motivational.tex variables.tex
	$(TEX) $<
	$(TEX) $<  # second time needed here!

cv.pdf: cv.tex variables.tex
	$(TEX) $<

cover: cover.pdf
motivational: motivational.pdf
cv: cv.pdf

clean:
	rm -f ./*.aux ./*.log ./*.out

fullclean: clean
	rm -f ./*.pdf
