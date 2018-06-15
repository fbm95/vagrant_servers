configure-worker:
  cmd.run:
    - name: docker swarm join --token $(cat /vagrant/worker_token) 172.17.8.101:2377
