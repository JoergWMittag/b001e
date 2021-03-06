#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

require 'rake'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')
specdir = File.expand_path(File.join(taskdir, '..', 'spec'))

desc 'Run the Specs'
task :spec do
  FileList[File.join specdir, '**', '*_suite.rb'].each { |specsuite| require specsuite }
end
