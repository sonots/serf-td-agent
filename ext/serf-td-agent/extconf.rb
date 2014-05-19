puts RUBY_PLATFORM

## ncpu detection specifics
#case RUBY_PLATFORM
#when /linux/
#  $defs << '-DHAVE_LINUX_PROCFS'
#else
#  if have_func('sysctlbyname', ['sys/param.h', 'sys/sysctl.h'])
#    $defs << '-DHAVE_SYSCTLBYNAME'
#  end
#end
#
#$LIBS << ' ' << libs.join(' ')
#
#dir_config('cool.io_ext')
#create_makefile('cool.io_ext')
#
## win32 needs to link in "just the right order" for some reason or  ioctlsocket will be mapped to an [inverted] ruby specific version.  See libev mailing list for (not so helpful discussion--true cause I'm not sure, but this overcomes the symptom)
#if RUBY_PLATFORM =~ /mingw|win32/
#  makefile_contents = File.read 'Makefile'
#
#  # "Init_cool could not be found" when loading cool.io.so.
#  # I'm not sure why this is needed. But this line causes "1114 A dynamic link library (DLL) initialization routine failed." So I commented out this line.
#  #makefile_contents.gsub! 'DLDFLAGS = ', 'DLDFLAGS = -export-all '
#
#  makefile_contents.gsub! 'LIBS = $(LIBRUBYARG_SHARED)', 'LIBS = -lws2_32 $(LIBRUBYARG_SHARED)'
#  File.open('Makefile', 'w') { |f| f.write makefile_contents }
#end
#
