#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

filelist = %w[
  b001e.gemspec
  lib/b001e/extensions/core/false_class_extensions.rb
  lib/b001e/extensions/core/nil_class_extensions.rb
  lib/b001e/extensions/core/object_extensions.rb
  lib/b001e/extensions/core/true_class_extensions.rb
  lib/b001e/falsiness.rb
  lib/b001e/truthiness.rb
  lib/b001e.rb
  LICENSE.txt
  Rakefile.rb
  README.rst
  spec/and_spec.rb
  spec/b001e_suite.rb
  spec/if_spec.rb
  spec/LICENSE.txt
  spec/not_spec.rb
  spec/or_spec.rb
  spec/spec_helper.rb
  spec/unless_spec.rb
  tasks/gem_task.rb
  tasks/spec_task.rb
  tasks/_default_task.rb
]

speclist = filelist.grep /^spec/

$spec = Gem::Specification.new do |s|
  s.name = 'b001e'
  s.summary = 'Message-sending based re-implementation of the Boolean operators.'
  s.version = Gem::Version.new '0.0.0a'
  s.author = 'Jörg W Mittag'
  s.email = 'JoergWMittag+B001e@GoogleMail.Com'
  s.homepage = 'http://JoergWMittag.GitHub.Com/b001e/'
  s.rubyforge_project = 'b001e'
  s.license = 'MIT X11'
  s.required_ruby_version = '~> 1.9.1'
  s.required_rubygems_version = '~> 1.3.5'
  s.has_rdoc = true
  s.rdoc_options = %w[--all --charset=UTF-8 --line-numbers --webcvs=https://GitHub.Com/JoergWMittag/B001e/blob/master/%s]
  s.extra_rdoc_files = %w[LICENSE.txt README.rst]
  s.files = filelist
  s.test_files = speclist
  s.description = <<-'HERE'
B001e is a message-sending based re-implementation of the
Boolean operators 'if', 'unless', 'and', 'or' and 'not' in
pure Ruby. Lazy Evaluation / Short-circuiting is achieved
through the use of blocks and lambda expressions.
  HERE
end

if __FILE__ == $0
  Gem::manage_gems
  Gem::Builder.new($spec).build
end
