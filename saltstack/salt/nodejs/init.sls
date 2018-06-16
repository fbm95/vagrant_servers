download_nodejs:
  cmd.run:
    - name: 'curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -'
    - user: root

install_nodejs:
  cmd.run:
    - name: 'apt-get install -y nodejs'
    - user: root

npm_update:
  cmd.run:
    - name: 'npm install npm --global'
    - user: root

install_angular_cli:
  cmd.run:
    - name: 'npm install -g @angular/cli'
    - user: root

