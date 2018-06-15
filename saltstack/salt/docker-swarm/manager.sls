enable-docker-api:
  file.managed:
    - name: /lib/systemd/system/docker.service
    - source: salt://docker-swarm/docker.service
    - user: root
    - template: jinja

reload-daemon:
  cmd.run:
    - name: systemctl daemon-reload
    - cwd: /
    - user: root

restart-docker-service:
  cmd.run:
    - name: service docker restart
    - cwd: /
    - user: root

init-manager:
  cmd.run:
    - name: docker swarm init --listen-addr 172.17.8.101:2377 --advertise-addr 172.17.8.101:2377
    - cwd: /
    - user: root

extract-worker-token:
  cmd.run:
    - name: docker swarm join-token --quiet worker > /vagrant/worker_token
    - cwd: /
    - user: root

install-swarm-visualizer:
  cmd.run:
    - name: docker run -it -d --name swarm-info -p 5000:8080 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer
    - cwd: /
    - user: root
