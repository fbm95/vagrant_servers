base:
  '*':
    - common

  'minion01':
    - nginx
    - docker
    - docker-swarm.manager

  'minion02':
    - docker
    - docker-swarm.worker

  'minion03':
    - docker
    - docker-swarm.worker