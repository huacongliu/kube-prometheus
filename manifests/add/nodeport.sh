kubectl  patch svc  grafana -n monitoring -p '{"spec":{"type":"NodePort","ports":[{"name":"http","port":3000,"protocol":"TCP","targetPort":"http","nodePort":30000}]}}'
kubectl  patch svc  prometheus-k8s -n monitoring -p '{"spec":{"type":"NodePort","ports":[{"name":"web","port":9090,"protocol":"TCP","targetPort":"web","nodePort":30090}]}}'
kubectl  patch svc  alertmanager-main -n monitoring -p '{"spec":{"type":"NodePort","ports":[{"name":"web","port":9093,"protocol":"TCP","targetPort":"web","nodePort":30093}]}}'
