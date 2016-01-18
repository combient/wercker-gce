# werker java dropwizard GCE

## Prerequisites

1. wercker account.
2. GCE account. [And getting started.](https://cloud.google.com/compute/docs/quickstart).
                [Howto push containers to Google container registry http://devcenter.wercker.com/docs/containers/pushing-containers.html#gcr]
4. kubernetes. [And getting started](http://kubernetes.io/gettingstarted/).

## Configuring GCE

<!-- 1. Setup a project for your cluster with meaningful properites such as names etc.
 
 2. Spawn some CoreOS instances via GUI -->
Though it possible to bootstrap an GCE Container Engine Cluster with just a several click, we want to take the hard way and configure our cluster from a workstation ourselves.

The kubernetes project provides [documentation](https://github.com/GoogleCloudPlatform/kubernetes/blob/master/docs/getting-started-guides/gce.md) for this case.


## Configuring on CoreOS


*For Master:*
```bash
gcloud compute instances create node-js-master-1 \
--image-project coreos-cloud \
--image https://www.googleapis.com/compute/v1/projects/coreos-cloud/global/images/coreos-alpha-709-0-0-v20150611 \
--boot-disk-size 200GB \
--machine-type n1-standard-1 \
--zone europe-west1-d \
--metadata-from-file user-data=master.yml
```

*For Nodes:*
```bash
gcloud compute instances create node-js-node-1 \
--image-project coreos-cloud \
--image https://www.googleapis.com/compute/v1/projects/coreos-cloud/global/images/coreos-alpha-709-0-0-v20150611 \
--boot-disk-size 200GB \
--machine-type n1-standard-1 \
--zone europe-west1-d \
--metadata-from-file user-data=node.yml
```

Run...

```bash
gcloud compute ssh node-js-master-1 --ssh-flag="-L 8080:127.0.0.1:8080" --zone europe-west1-d
# Run from inside master.
gcloud compute ssh node-js-master-1 --ssh-flag="-R 8080:127.0.0.1:8080" --zone europe-west1-d
```

Read on
https://coreos.com/blog/building-minimal-containers-with-quay-kubernetes-wercker/
https://github.com/GoogleCloudPlatform/kubernetes/blob/master/examples/guestbook/README.md