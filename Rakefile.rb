#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

require 'rake'

taskdir = File.expand_path File.join(File.dirname(__FILE__), 'tasks')
$LOAD_PATH.unshift taskdir unless $LOAD_PATH.include? taskdir

FileList[File.join taskdir, '**', '*_task.rb'].each { |raketask| load raketask }
