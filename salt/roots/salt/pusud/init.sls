include:
  - golang
  - git
  - supervisor

/etc/supervisor/conf.d/pusud.conf:
  file.managed:
    - source: salt://pusud/pusud.conf
    - watch_in:
      - service: supervisor
