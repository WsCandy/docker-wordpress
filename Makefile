build:
	@docker build -t wscandy/wordpress .

clean:
	@-docker rmi wscandy/wordpress . -f

rebuild: clean build