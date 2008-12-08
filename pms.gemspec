# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pms}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = %q{2008-12-08}
  s.description = %q{Poor Man's Search}
  s.email = %q{jens.wille@uni-koeln.de}
  s.extra_rdoc_files = ["COPYING", "ChangeLog", "README"]
  s.files = ["lib/pms.rb", "lib/pms/proxy.rb", "lib/pms/ext.rb", "lib/pms/version.rb", "lib/pms/index.rb", "Rakefile", "COPYING", "ChangeLog", "README", "spec/spec_helper.rb", "spec/pms/proxy_spec.rb", "spec/pms/index_spec.rb", "spec/pms/ext_spec.rb", "spec/pms_spec.rb", "test_data/fox.txt"]
  s.has_rdoc = true
  s.homepage = %q{http://pms.rubyforge.org/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "pms Application documentation", "--main", "README", "--charset", "UTF-8", "--all"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pms}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Poor Man's Search}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
