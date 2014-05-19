require 'mkmf'
# I actually do not need this, but it looks gem install requires Makefile anyway
create_makefile('serf-td-agent')

# curl --insecure --silent -L -O  https://dl.bintray.com/mitchellh/serf/0.6.0_linux_amd64.zip
CURL_CMD="curl --insecure --silent -L -O"
SERF_BASEURI="https://dl.bintray.com/mitchellh/serf"
SERF_VERSION="0.6.0"

os, arch = nil, nil
case RUBY_PLATFORM
when /linux/
  os = 'linux'
when /darwin/
  os = 'darwon'
when /mingw|win32/
  os = 'windows'
when /freebsd/
  os = 'freebsd'
end
case RUBY_PLATFORM
when /i386|i686/
  arch = '386'
when /x86_64|amd64/
  arch = 'amd64'
when /arm/
  arch = 'arm'
end

zip_filename = "#{SERF_VERSION}_#{os}_#{arch}.zip"
system "#{CURL_CMD} #{SERF_BASEURI}/#{zip_filename}"
system "unzip #{zip_filename} -d #{File.expand_path('../../../bin', __FILE__)}"
