{% set redis = pillar.get('redis', {}) -%}
{% set version = redis.get('version', 'stable') -%}
{% set checksum = redis.get('checksum', 'md5=5a4d2e64b16295e9862a0a44ff9539d1') -%}
{% set root = redis.get('root', '/usr/local') -%}

redis-dependencies:
  pkg.installed:
    - names:
        - build-essential
        - python-dev
        - libxml2-dev

## Get redis
get-redis:
  file.managed:
    - name: {{ root }}/redis-{{ version }}.tar.gz
    - source: http://download.redis.io/redis-{{ version }}.tar.gz
    - source_hash: {{ checksum }}
    - require:
      - pkg: redis-dependencies
  cmd.wait:
    - cwd: {{ root }}
    - names:
      - tar -zxvf {{ root }}/redis-{{ version }}.tar.gz -C {{ root }}
    - watch:
      - file: get-redis

make-redis:
  cmd.wait:
    - cwd: {{ root }}/redis-{{ version }}
    - names:
      - make
      - make install
    - watch:
      - cmd: get-redis
