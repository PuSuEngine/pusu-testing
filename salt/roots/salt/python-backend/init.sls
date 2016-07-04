include:
  - python
  - supervisor
  
/etc/supervisor/conf.d/python-backend.conf:
  file.managed:
    - source: salt://python-backend/python-backend.conf
    - watch_in:
      - service: supervisor
