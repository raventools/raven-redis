name             'raven-redis'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures raven-redis'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "raven-deploy"

attribute "raven-redis",
    :display_name => "Raven Redis",
    :type => "hash"

attribute "raven_redis/redis/maxmemory",
    :display_name => "Redis Maximum Memory",
    :description => "Maximum amount of memory to allocate to redis",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven-redis::default","raven-redis::configure"],
    :default => "1G"

attribute "raven_redis/redis/savepath",
    :display_name => "Redis Save Path",
    :description => "Path in which to save the periodic memory dump",
    :required => "optional",
    :type => "string",
    :recipes => ["raven-redis::default","raven-redis::configure"],
    :default => "/tmp/redis"

attribute "raven_redis/redis/password",
    :display_name => "Redis Password",
    :description => "Redis Password",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven-redis::default","raven-redis::configure"]
