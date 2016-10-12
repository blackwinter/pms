require_relative 'lib/pms/version'

begin
  require 'hen'

  Hen.lay! {{
    gem: {
      name:         %q{pms},
      version:      PMS::VERSION,
      summary:      %q{Poor Man's Search},
      description:  %q{A simple searching facility for (nearly) arbitrary input.},
      author:       %q{Jens Wille},
      email:        %q{jens.wille@gmail.com},
      license:      %q{AGPL-3.0},
      homepage:     :blackwinter,
      dependencies: { lsi4r: ['~> 0.0', '>= 0.0.2'], unicode: '~> 0.4' },

      required_ruby_version: '>= 2.0'
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end
