redis
=====

redis
-------

Install redis only

redis.server
---------------

Install redis and start up the service (currently, only upstart/ubuntu supported).

For a list of all available options, look at: `redis/templates/redis.conf.jinja`

WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. 
To fix this issue add 'vm.overcommit_memory  = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
