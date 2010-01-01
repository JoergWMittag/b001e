# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

require 'b001e/truthiness'

module B001e
  module Extensions
    module Core
      module TrueClassExtensions
        include B001e::Truthiness
      end
    end
  end
end

class TrueClass
  include B001e::Extensions::Core::TrueClassExtensions
end
