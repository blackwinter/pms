require 'rubygems'

unless Object.const_defined?(:BASE)
  BASE = File.join(File.dirname(__FILE__), '..')

  $: << File.join(BASE, 'lib')
  require 'pms'

  FOX = File.join(BASE, 'spec', 'fox.txt')
end
