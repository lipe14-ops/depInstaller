FILE = ./src/main.sh
LINK_NAME = depinstaller

install: link_file
	chmod +x ./$(LINK_NAME)
	mv ./$(LINK_NAME) /usr/bin

remove:
	rm /usr/bin/$(LINK_NAME)

link_file: $(FILE)
	cp $(FILE) ./$(LINK_NAME)
