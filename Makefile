.PHONY: docker
docker:
	docker build -t ads-trial:dev -f deploy/Dockerfile .
.PHONY: run
run:
	docker-compose -f deploy/docker-compose.yaml up
.PHONY: rund
rund:
	docker-compose -f deploy/docker-compose.yaml up -d