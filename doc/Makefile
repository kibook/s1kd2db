SOURCE=DMC-S1KD2DB-A-00-00-00-00A-040A-D_000-01_EN-CA.XML
OUTPUT=../README.md

$(OUTPUT): $(SOURCE)
	xsltproc ../s1kd2db.xsl $(SOURCE) | pandoc -f docbook -t markdown_github > $(OUTPUT)

clean:
	rm -f $(OUTPUT)
