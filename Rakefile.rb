#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

require 'rake'

basedir = File.expand_path File.dirname(__FILE__)
taskdir = File.expand_path File.join(basedir, 'tasks')
specdir = File.expand_path File.join(basedir, 'spec')
libdir  = File.expand_path File.join(basedir, 'lib')

$LOAD_PATH.unshift(specdir) unless $LOAD_PATH.include?(specdir)
$LOAD_PATH.unshift(libdir)  unless $LOAD_PATH.include?(libdir)

FileList[File.join taskdir, '**', '*_task.rb'].each { |raketask| load raketask }
