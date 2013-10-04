#
# Cookbook Name:: airtime
# Recipe:: database

postgresql_connection_info = {
  :host     => node['airtime']['db']['host'],
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

# create an airtime postgresql database 
postgresql_database node['airtime']['db']['name'] do
  connection postgresql_connection_info
  encoding 'UTF-8'
  collation "en_US.UTF-8"
  template 'template0'
  action :create
end

# Create a postgresql airtime user
postgresql_database_user node['airtime']['db']['user'] do
  connection postgresql_connection_info
  password   node['airtime']['db']['password']
  action     :create
end

# Grant all privileges on all tables in airtime db
postgresql_database_user node['airtime']['db']['user'] do
  connection    postgresql_connection_info
  database_name node['airtime']['db']['name']
  password      node['airtime']['db']['password']
  privileges    [:all]
  action        :grant
end