# Elastic Services

## Pre-Requisites

* Docker
* Kubernetes
* Helm
* Helmsman

## Deploy To your local Kubernetes Cluster

First you will need to ensure you're deploying to your local kubernetes. You can
switch your kubernetes context to use your local docker.

```
kubectl config set-context docker-desktop
```

Then you can run

```
# Create development namespace and set kubernetes secret to use the
# enterprise trial
make start-trial

# deploy using helmsman
make deploy
```

## Using Kibana

Once the app has been deployed to kubernetes we can now access Kibana

https://localhost:5601

### SSL Verification

Because we're using a locally generated certificate, the browser is expected to present
us a big warning since it cannot verify the certificates. You can ignore the browser warning
and continue forward.

### Logging in

Now that you are at the login page we need a username and password.

```
Username: elastic
```

Then run

```
make get-password
```

To obtain the password for the `elastic` user.
