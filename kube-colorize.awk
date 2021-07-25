{ 
  # Usage:
  # kubectl get pods -n [NAMESPACE] | awk -f kube-colorize.awk

  # Non-exhaustive pod status mapping
  # Success
  # Container States
  color["Running"] = "\033[32m"
  color["Completed"] = "\033[32m"

  # Errors
  # https://github.com/kubernetes/kubernetes/blob/ea0764452222146c47ec826977f49d7001b0ea8c/pkg/kubelet/images/types.go
  color["Failed"] = "\033[31m"
  color["Evicted"] = "\033[31m"
  color["ImagePullBackOff"] = "\033[31m"
  color["ErrImagePull"] = "\033[31m"
  color["ImageInspectError"] = "\033[31m"
  color["ErrImageNeverPull"] = "\033[31m"
  color["RegistryUnavailable"] = "\033[31m"
  color["InvalidImageName"] = "\033[31m"
  color["Pending"] = "\033[33m"

  # Other
  color["Terminated"] = "\033[90m"

  for(i=1;i<=NF;i++) {
    if ($i == "STATUS") {
        col=i
    	break
    }
  }

  n = split($0, a, " ", b)
  a[col] = color[a[col]] a[col] "\033[0m"
  line = b[0]
  for (i=1; i<=n; i++)
      line=(line a[i] b[i])
  print line
}
