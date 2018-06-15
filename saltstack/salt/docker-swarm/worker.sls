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

configure-worker:
  cmd.run:
    - name: docker swarm join --token $(cat /vagrant/worker_token) 172.17.8.101:2377
