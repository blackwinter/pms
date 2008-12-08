#--
###############################################################################
#                                                                             #
# pms - Poor Man's Search.                                                    #
#                                                                             #
# Copyright (C) 2008 Jens Wille                                               #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@uni-koeln.de>                                    #
#                                                                             #
# pms is free software; you can redistribute it and/or modify it under the    #
# terms of the GNU General Public License as published by the Free Software   #
# Foundation; either version 3 of the License, or (at your option) any later  #
# version.                                                                    #
#                                                                             #
# pms is distributed in the hope that it will be useful, but WITHOUT ANY      #
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS   #
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more       #
# details.                                                                    #
#                                                                             #
# You should have received a copy of the GNU General Public License along     #
# with pms. If not, see <http://www.gnu.org/licenses/>.                       #
#                                                                             #
###############################################################################
#++

require 'pms/index'
require 'pms/proxy'

class PMS

  attr_reader :input, :index

  def initialize(input)
    @input = input
    @index = Index.new(input)
  end

  def search(token = nil)
    token ? TokenProxy.new(self, token) : Proxy.new(self).and { |*a| yield(*a) }
  end

  def results
    @index.entries
  end

  def matches
    @index.matches
  end

end
