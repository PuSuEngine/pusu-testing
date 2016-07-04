include:
  - golang
  - supervisor

/etc/supervisor/conf.d/go-backend.conf:
  file.managed:
    - source: salt://go-backend/go-backend.conf
    - watch_in:
      - service: supervisor