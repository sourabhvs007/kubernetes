The ruby-blog application is dockerized and managed using kubernetes. 


Issues faced

1 ) Rolling update ( recreating pods with changes to docker image permissions ) 
possible cause : kubernetes doesnot support this feature as this might change the physical state of the machine . Not possible with replication sets / pod creation.

** IT is possible to change the image state and do a rolling update using "deployment" ( kind)

To rollout to the previous version use the following command
kubectl rollout undo deployment/<deployment_name>  .

2 ) Implement kube proxy [ port 80 of minikube ]

3 ) DB migration of rails app - Done 
Solution : Give the host an environment variable ( database.yml ) pointing to the DB pod along with username [postgres] and passowrd and rebuild the app and push it to the docker registry . recreate the pod 

4 ) Check deployment mechanism ( pushing new docker image to registry and deploying the changes to the pods ) .  Done

NOTE : Always use kind: deployment in kubernetes as it takes care of replication and pod management . no need to create pods independently . ( use case for individual pod creation is for testing purpose only ) .