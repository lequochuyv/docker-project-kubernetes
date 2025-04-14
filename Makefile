PORT_DB = 3307
PORT_BACKEND = 3000
PORT_FRONTEND = 8080

.PHONY: build-init
build-init:
	@echo "Build init..."
	skaffold dev

.PHONY: run-database
run-database:
	@echo "Run database..."
	kubectl apply -f k8s/namespace.yaml
	kubectl apply -f k8s/mysql-secret.yaml
	kubectl apply -f k8s/mysql.yaml
