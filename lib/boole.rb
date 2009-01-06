# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'b001e/extensions/core/object_extensions'
require 'b001e/extensions/core/true_class_extensions'
require 'b001e/extensions/core/false_class_extensions'
require 'b001e/extensions/core/nil_class_extensions'
