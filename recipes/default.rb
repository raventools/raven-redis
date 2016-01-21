
include_recipe "raven-redis::install"
include_recipe "raven-redis::configure"

service "redis" do
	action [ :enable, :start ]
end
