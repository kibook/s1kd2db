PREFIX=/usr/local
FOLDER=$(PREFIX)/share/xml/s1000d/stylesheet/s1kd2db

all:

install:
	mkdir -p $(FOLDER)
	cp -r s1kd2db.xsl $(FOLDER)
	cp s1kd2db $(PREFIX)/bin
