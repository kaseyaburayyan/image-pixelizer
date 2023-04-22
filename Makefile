install-global-deps:
	npm install -g winglang create-react-app

install:
	npm install
	cd pixelizer && npm install


############################################################################################
# Wing specific

compile:
	wing compile --target tf-aws app.w

clean:
	rm -rf target/

tf-list:
	terraform -chdir=./target/app.tfaws/ state list

tf-show:
	terraform -chdir=./target/app.tfaws/ state show aws_api_gateway_deployment.root_cloudApi_api_deployment_E29F699A

plan:
	terraform -chdir=./target/app.tfaws/ init
	terraform -chdir=./target/app.tfaws/ plan

apply:
	terraform -chdir=./target/app.tfaws/ init
	terraform -chdir=./target/app.tfaws/ apply -auto-approve

destroy:
	terraform -chdir=./target/app.tfaws/ destroy -auto-approve

############################################################################################
# React front end

run:
	cd pixelizer && npm start

build:
	cd pixelizer && npm run build
	ls -la
	cp -a pixelizer/build/ build/