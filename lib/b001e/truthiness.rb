# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

module B001e
  module Truthiness
    def if
      yield
    end

    def ifelse then_branch = ->{}, _ = nil
      then_branch.()
    end

    def unless
    end

    def unlesselse _ = nil, else_branch = ->{}
      ifelse else_branch, _
    end

    def and
      yield
    end

    def or
      self
    end

    def not
      false
    end
  end
end
