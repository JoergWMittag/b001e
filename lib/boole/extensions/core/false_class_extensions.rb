# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'b001e/falsiness'

module B001e
  module Extensions
    module Core
      module FalseClassExtensions
        include B001e::Falsiness
      end
    end
  end
end

class FalseClass
  include B001e::Extensions::Core::FalseClassExtensions
end