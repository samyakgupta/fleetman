

build:
	./bin/build.sh

deploy:
	find ./ -name deploy.yaml | xargs -n1 kubectl apply -f

proxy:
	kubectl port-forward $(shell kubectl get pods -l app=webapp -ojsonpath='{.items[0].metadata.name}')  8080:80
	
clean:
	find ./ -name deploy.yaml | xargs -n1 kubectl delete -f
