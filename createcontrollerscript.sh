#!/bin/bash

cat > controller.json <<EOF
{
  "kind": "ReplicationController",
  "apiVersion": "v1",
  "metadata": {
    "name": "helloworld",
    "labels": {
      "name": "helloworld"
    }
  },
  "spec": {
    "replicas": 3,
    "selector": {
      "name": "helloworld"
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "helloworld",
          "deployment": "${WERCKER_GIT_COMMIT}"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "${GCLOUD_REPOSITORY}:${WERCKER_GIT_COMMIT}",
            "name": "helloworld",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 8080,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    }
  }
}
EOF