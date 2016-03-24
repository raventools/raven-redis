user "redis" do
	comment "redis user"
	system true
	shell "/bin/false"
end

template "/etc/redis.conf" do
    source "redis.conf.erb"
    owner "redis"
    mode 0644
    variables ({
        :savepath => node[:raven_redis][:redis][:savepath],
		:password => node[:raven_redis][:redis][:password],
		:maxmemory => node[:raven_redis][:redis][:maxmemory]
    })
end

directory "/tmp/redis" do
	owner "redis"
	mode 0755
end

directory "/var/run/redis" do
	owner "redis"
	mode 0755
end

file "/var/log/redis.log" do
	owner "redis"
end

directory node[:raven_redis][:redis][:savepath] do
	owner "redis"
end
