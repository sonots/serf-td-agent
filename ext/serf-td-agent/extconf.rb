require 'mkmf'
# I actually do not need this, but it looks gem install requires Makefile anyway
create_makefile('serf-td-agent')

def http_download(uri, dest = nil)
  require 'open-uri'
  require 'openssl'
  dest ||= File.basename(uri)
  open(dest, 'wb') do |file|
    open(uri, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, redirect: true) do |data|
      file.write(data.read)
    end
  end
end

def unzip(zip_file, dest = '.')
  require 'zip/zip'
  Zip::ZipFile.open(zip_file) do |zip|
    zip.each do |entry|
      zip.extract(entry, "#{dest}/#{entry.to_s}") { true } # true to overwrite
    end
  end
end

# http://dl.bintray.com/mitchellh/serf/0.6.0_linux_amd64.zip
SERF_BASEURI="http://dl.bintray.com/mitchellh/serf"
SERF_VERSION="0.6.0"

os, arch = nil, nil
case RUBY_PLATFORM
when /linux/
  os = 'linux'
when /darwin/
  os = 'darwin'
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
http_download("#{SERF_BASEURI}/#{zip_filename}")
unzip(zip_filename, "#{File.expand_path('../../../bin', __FILE__)}")
