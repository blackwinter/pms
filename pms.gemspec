# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pms}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = %q{2011-04-29}
  s.description = %q{Poor Man's Search}
  s.email = %q{jens.wille@uni-koeln.de}
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/pms.rb", "lib/pms/index.rb", "lib/pms/proxy.rb", "lib/pms/ext.rb", "lib/pms/version.rb", "README", "ChangeLog", "Rakefile", "COPYING", "spec/pms/index_spec.rb", "spec/pms/ext_spec.rb", "spec/pms/proxy_spec.rb", "spec/spec.opts", "spec/fox.txt", "spec/spec_helper.rb", "spec/pms_spec.rb"]
  s.homepage = %q{http://pms.rubyforge.org/}
  s.rdoc_options = ["--line-numbers", "--main", "README", "--charset", "UTF-8", "--all", "--title", "pms Application documentation (v0.0.5)"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pms}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Poor Man's Search}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
