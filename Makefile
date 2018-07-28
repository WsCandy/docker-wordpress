build:
	@docker build -t wscandy/wordpress .

clean:
	@-docker rmi wscandy/wordpress .

rebuild: clean build