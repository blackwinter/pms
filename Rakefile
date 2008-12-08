require %q{lib/pms/version}

begin
  require 'hen'

  Hen.lay! {{
    :rubyforge => {
      :project  => %q{pms},
      :package  => %q{pms},
      :rdoc_dir => nil
    },

    :gem => {
      :version      => PMS::VERSION,
      :summary      => %q{Poor Man's Search},
      :homepage     => %q{http://pms.rubyforge.org/},
      :files        => FileList['lib/**/*.rb'].to_a,
      :extra_files  => FileList['[A-Z]*', 'spec/**/*.rb', 'test_data/**/*'].to_a,
      :dependencies => %w[]
    }
  }}
rescue LoadError
  abort "Please install the 'hen' gem first."
end

### Place your custom Rake tasks here.
