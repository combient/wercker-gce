#!/bin/bash

cat > controller.json <<EOF
{
   "kind":"ReplicationController",
   "apiVersion":"v1",
   "metadata":{
      "name":"helloworld",
      "labels":{
         "app":"helloworld"
      }
   },
   "spec":{
      "replicas":3,
      "selector":{
         "app":"helloworld"
      },
      "template":{
         "metadata":{
            "labels":{
               "app":"helloworld"
               "deployment": "${WERCKER_GIT_COMMIT}"
            }
         },
         "spec":{
            "containers":[
               {
                  "name":"helloworld",
                  "image": "${GCLOUD_REPOSITORY}:${WERCKER_GIT_COMMIT}",
                  "ports":[
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