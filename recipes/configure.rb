user "redis" do
	comment "redis user"
	system true
	shell "/bin/false"
end

template "/etc/redis/redis.conf" do
    source "redis.conf.erb"
    owner "redis"
    mode 0644
    variables ({
        :savepath => node[:app_frontend][:redis][:savepath],
		:password => node[:app_frontend][:redis][:password],
		:maxmemory => node[:app_frontend][:redis][:maxmemory]
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

directory node[:app_frontend][:redis][:savepath] do
	owner "redis"
end
