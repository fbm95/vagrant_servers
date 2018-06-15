nginx:
  pkg.installed:
    - name: nginx
  service.running:
    - enable: True

copy_nginx_default_site:
  file.managed:
    - source: salt://nginx/files/default
    - name: /etc/nginx/sites-available/default
    - user: root
    - template: jinja

restart_nginx:
  cmd.run:
    - name: 'service nginx restart'
    - user: root
