#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

require 'rake'
begin require 'rubygems'; rescue LoadError
else begin gem 'jscruggs-metric_fu', '~> 0.8.0'; rescue Gem::LoadError; end end
require 'metric_fu'
