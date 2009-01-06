# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

require 'minitest/spec'
require 'minitest/mock'
require 'minitest/autorun'

libdir = File.expand_path File.join(File.dirname(__FILE__), 'lib').gsub(/(.*)spec.*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

specdir = File.expand_path(File.dirname __FILE__).gsub(/(.*spec).*?/, '\1')
$LOAD_PATH.unshift specdir unless $LOAD_PATH.include? specdir
