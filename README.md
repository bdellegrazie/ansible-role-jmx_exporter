# ansible-role-jmx\_exporter

Installs the JMX Exporter for Prometheus, includes service control to run the JMX httpserver version as well.

[![Build Status](https://travis-ci.org/bdellegrazie/ansible-role-jmx_exporter.svg?branch=master)](https://travis-ci.org/bdellegrazie/ansible-role-jmx_exporter)

# Requirements

Requires Ansible role `bdellegrazie.ansible-role-prometheus_exporter`

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `jmx_exporter_version`| Version of the exporter to use | `0.3.1` |

Other variables are in defaults/main.yml

# Dependencies

    `bdellegrazie.prometheus_exporter`

# Example Playbook

    - hosts: all
      roles:
        - { role: ansible-role-jmx_exporter }

# License

GPLv3

Author Information
------------------

https://github.com/bdellegrazie/ansible-role-jmx_exporter
