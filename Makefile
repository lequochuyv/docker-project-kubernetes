PORT_DB = 3307
PORT_BACKEND = 3000
PORT_FRONTEND = 8080

.PHONY: build-init
build-init:
	@echo "Build init..."
	skaffold dev

.PHONY: port-forward
port-forward:
	@echo "Port forward..."
	kubectl port-forward -n project-kubernetes-namespace service/backend-nodejs-service 5000:5000