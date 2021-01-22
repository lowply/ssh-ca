build:
	docker build . -t lowply/ssh-ca

run:
	docker run -it --rm -v $(CURDIR)/client:/root lowply/ssh-ca
