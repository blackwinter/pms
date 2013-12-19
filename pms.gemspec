# -*- encoding: utf-8 -*-
# stub: pms 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "pms"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = "2013-12-19"
  s.description = "Poor Man's Search"
  s.email = "jens.wille@gmail.com"
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/pms.rb", "lib/pms/ext.rb", "lib/pms/index.rb", "lib/pms/proxy.rb", "lib/pms/version.rb", "COPYING", "ChangeLog", "README", "Rakefile", "spec/fox.txt", "spec/pms/ext_spec.rb", "spec/pms/index_spec.rb", "spec/pms/proxy_spec.rb", "spec/pms_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/blackwinter/pms"
  s.licenses = ["AGPL-3.0"]
  s.post_install_message = "\npms-0.0.6 [2013-12-19]:\n\n* Added LSI support.\n* Housekeeping and fixes.\n\n"
  s.rdoc_options = ["--title", "pms Application documentation (v0.0.6)", "--charset", "UTF-8", "--line-numbers", "--all", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Poor Man's Search"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<unicode>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-nuggets>, [">= 0.9.4"])
    else
      s.add_dependency(%q<unicode>, [">= 0"])
      s.add_dependency(%q<ruby-nuggets>, [">= 0.9.4"])
    end
  else
    s.add_dependency(%q<unicode>, [">= 0"])
    s.add_dependency(%q<ruby-nuggets>, [">= 0.9.4"])
  end
end
