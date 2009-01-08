# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

module B001e
  module Falsiness
    def if
    end

    def ifelse _ = nil, else_branch = ->() {}
      else_branch.call
    end

    def unless
      yield
    end

    def unlesselse unless_branch = ->() {}, _ = nil
      ifelse _, unless_branch
    end

    def and
      self
    end

    def or
      yield
    end

    def not
      true
    end
  end
end
