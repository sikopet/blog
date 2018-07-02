Namespace

* group of objects in a cluster

```
kubectl get namespaces
```

Context

* to change the default namespace more permanently
* to manage different clusters
* to manage different users

```
# list contexts
kubectl config view

# switch context
kubectl config use-context <context-name>
```

Objects

* everything in Kubernetes is represented by a RESTful resource
* these resources are called Kubernetes objects
* each object exists at a unique HTTP path, e.g. `https://your-k8s.com/api/v1/namespaces/default/pods/my-pod`
* the `kubectl` makes requests to these URLs to access the objects

```
# view Kubernetes objects
kubectl get                       # all resource types
kubectl get <resource>            # all resources in a namespace
kubectl get <resource> <object>   # specific resource

# details about an object
kubectl describe <resource> <object>

# output flags
-o wide       # more details
-o json       # complete object in JSON format
-o yaml       # complete object in YAML format
--no-headers

# create, update objects
kubectl apply -f obj.yaml

# delete objects
kubectl delete -f obj.yaml  # no additional prompting!

# delete objects
kubectl delete <resource> <object>

# debugging
kubectl logs <pod>
kubectl exec -it <pod> -- bash  # or sh instead of bash
kubectl cp <pod>:/path/to/remote/file /path/to/local/file
```

Iportant resources

* deployment
* service
* ingress

Resources

* Kubernetes: Up and Running (2017)
