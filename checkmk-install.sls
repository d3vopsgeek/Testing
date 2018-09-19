/etc/salt/checkmk:
   file.directory:
    - user: adminroot
    - name: /etc/salt/checkmk
    - mode: 755

checkmk:
   firewalld.service:
     - name: checkmk
     - ports:
        - 6556/tcp    

public:
   firewalld.present:
     - name: public
     - ports: 
         - 6556/tcp

download-file:
   file.managed:
        - name: /etc/salt/checkmk/check-mk-agent-1.4.0p24-1.noarch.rpm
        - mode: 750
        - source: http://mkserver/mysite/check_mk/agents/check-mk-agent-1.4.0p24-1.noarch.rpm
        - skip_verify: True

install-agent:
   pkg.installed:
      - sources:
          - check_mk: /etc/salt/checkmk/check-mk-agent-1.4.0p24-1.noarch.rpm
      - unless:
          - rpm -q check-mk-agent-1.4.0p24-1.noarch
      - order: last
      
