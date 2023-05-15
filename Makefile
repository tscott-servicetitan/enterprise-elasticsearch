deploy:
	helmsman --apply -f platform/helmsman/main.yaml

force-deploy:
	helmsman --apply -f platform/helmsman/main.yaml -always-upgrade --debug --verbose

start-trial:
	./scripts/update-license.sh

get-license:
	kubectl -n development get configmap elastic-licensing -o json | jq .data

get-status:
	kubectl get elastic -n development -l "app.kubernetes.io/instance"=elastic-stack

kget-%:
	kubectl -n development get $(subst kget-,,$@)

get-password:
	kubectl get secret -n development elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo

clean:
	kubectl delete namespace development && kubectl delete namespace elastic-system

download-apm-cert:
	kubectl -n development get secret elastic-apm-server-eck-apm-server-apm-http-certs-public -o go-template='{{index .data "ca.crt" | base64decode }}' > config/ca.crt
