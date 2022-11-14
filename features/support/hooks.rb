Before('@javascript') do
  @javascript = true
end

# Before('@lvh') do
#   Capybara.default_host = 'http://lvh.me'
#   Capybara.app_host = 'http://lvh.me'
# end

Before('@lvh') do
  set_host 'lvh.me:9887'
end

def set_host(host)
  # host! host
  Capybara.server_port = 9887
  default_url_options[:host] = host
  Capybara.app_host = 'http://' + host
end