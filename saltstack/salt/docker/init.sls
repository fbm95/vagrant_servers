install-docker:
  cmd.script:
    - source: salt://docker/install_docker.sh
    - cwd: /
    - user: root