require File.expand_path(%q{../lib/pms/version}, __FILE__)

begin
  require 'hen'

  Hen.lay! {{
    :rubyforge => {
      :project => %q{pms}
    },

    :gem => {
      :version => PMS::VERSION,
      :summary => %q{Poor Man's Search},
      :author  => %q{Jens Wille},
      :email   => %q{jens.wille@uni-koeln.de}
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end
