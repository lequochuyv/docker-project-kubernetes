PORT_DB = 3307
PORT_BACKEND = 3000
PORT_FRONTEND = 8080

.PHONY: build-init
build-init:
	@echo "Build init..."
	skaffold dev

.PHONY: setup-service-db
setup-service-db:
	@echo "Setup service db..."
	kubectl apply -f k8s/mysql-service.yaml
