# -*- encoding: utf-8 -*-
# stub: pms 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "pms"
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jens Wille"]
  s.date = "2014-12-19"
  s.description = "A simple searching facility for (nearly) arbitrary input."
  s.email = "jens.wille@gmail.com"
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["COPYING", "ChangeLog", "README", "Rakefile", "lib/pms.rb", "lib/pms/ext.rb", "lib/pms/i18n.rb", "lib/pms/index.rb", "lib/pms/proxy.rb", "lib/pms/version.rb", "spec/fox.txt", "spec/pms/ext_spec.rb", "spec/pms/index_spec.rb", "spec/pms/proxy_spec.rb", "spec/pms_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/blackwinter/pms"
  s.licenses = ["AGPL-3.0"]
  s.post_install_message = "\npms-0.0.7 [2014-12-19]:\n\n* Requires at least Ruby 2.0.\n* Slightly refactored.\n\n"
  s.rdoc_options = ["--title", "pms Application documentation (v0.0.7)", "--charset", "UTF-8", "--line-numbers", "--all", "--main", "README"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.4.5"
  s.summary = "Poor Man's Search"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<lsi4r>, [">= 0.0.2", "~> 0.0"])
      s.add_runtime_dependency(%q<unicode>, ["~> 0.4"])
      s.add_development_dependency(%q<hen>, [">= 0.8.1", "~> 0.8"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<lsi4r>, [">= 0.0.2", "~> 0.0"])
      s.add_dependency(%q<unicode>, ["~> 0.4"])
      s.add_dependency(%q<hen>, [">= 0.8.1", "~> 0.8"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<lsi4r>, [">= 0.0.2", "~> 0.0"])
    s.add_dependency(%q<unicode>, ["~> 0.4"])
    s.add_dependency(%q<hen>, [">= 0.8.1", "~> 0.8"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
