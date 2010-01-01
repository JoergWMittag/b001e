# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+B001e@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

require 'b001e/falsiness'

module B001e
  module Extensions
    module Core
      module NilClassExtensions
        include B001e::Falsiness
      end
    end
  end
end

class NilClass
  include B001e::Extensions::Core::NilClassExtensions
end
