nginx-user:
    group.present:
      - name: nginx
    user.present:
      - name: nginx
      - fullname: nginx
      - shell: /bin/false
      - groups:
        - nginx
        - vagrant

{{ pillar["pkgs"]["nginx"] }}:
  pkg:
    - installed

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: {{ pillar["pkgs"]["nginx"] }}
    - watch:
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf
    - require:
      - pkg: {{ pillar["pkgs"]["nginx"] }}
