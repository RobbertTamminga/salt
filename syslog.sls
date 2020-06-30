syslog:
    pkg.installed:
        - name: rsyslog
    
    file.managed:
        - name: /etc/rsyslog.conf
        - source: salt://rsyslog.conf
        - replace: True
    
    service.running:
        - enable: True
        - reload: True
        - pkg: rsyslog
        