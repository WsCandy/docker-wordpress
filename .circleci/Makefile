name:= wordpress
user:= wscandy

build:
	@docker build -t ${user}/${name}:${VERSION} .
	@make -f .circleci/Makefile save VERSION=$$VERSION

save:
	@mkdir -p docker_cache
	@docker save -o docker_cache/${VERSION}.tar ${user}/${name}:${VERSION}

restore:
	@docker load < docker_cache/${VERSION}.tar

deploy:
	@docker login -u ${DOCKERHUB_USER} -p "${DOCKERHUB_PASSWORD}"
	docker push ${user}/${name}:${VERSION}