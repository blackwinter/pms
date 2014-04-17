require File.expand_path(%q{../lib/pms/version}, __FILE__)

begin
  require 'hen'

  Hen.lay! {{
    :gem => {
      :name         => %q{pms},
      :version      => PMS::VERSION,
      :summary      => %q{Poor Man's Search},
      :author       => %q{Jens Wille},
      :email        => %q{jens.wille@gmail.com},
      :license      => %q{AGPL-3.0},
      :homepage     => :blackwinter,
      :dependencies => %w[lsi4r unicode]
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end
