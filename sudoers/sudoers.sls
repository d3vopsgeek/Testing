automation:
   group.present:
      - addusers:
         - adminroot

/etc/sudoers:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://sudoers.tmp 
    - check_cmd: /usr/sbin/visudo -c -f
    - order: last

