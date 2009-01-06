#!/usr/bin/env rake1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

require 'rake'
require 'rake/gempackagetask'
require 'rubygems'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')
$LOAD_PATH.unshift taskdir unless $LOAD_PATH.include? taskdir

basedir = File.expand_path File.join(taskdir, '..')
$LOAD_PATH.unshift basedir unless $LOAD_PATH.include? basedir

load Dir[File.expand_path File.join(basedir, '*.gemspec')].first

Rake::GemPackageTask.new($spec) do |pkg|
  pkg.need_tar     = true
  pkg.need_tar_gz  = true
  pkg.need_tar_bz2 = true
  pkg.need_zip     = true
end
