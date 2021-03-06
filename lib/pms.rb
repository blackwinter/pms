#--
###############################################################################
#                                                                             #
# pms - Poor Man's Search.                                                    #
#                                                                             #
# Copyright (C) 2008-2013 Jens Wille                                          #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@gmail.com>                                       #
#                                                                             #
# pms is free software; you can redistribute it and/or modify it under the    #
# terms of the GNU Affero General Public License as published by the Free     #
# Software Foundation; either version 3 of the License, or (at your option)   #
# any later version.                                                          #
#                                                                             #
# pms is distributed in the hope that it will be useful, but WITHOUT ANY      #
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS   #
# FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for     #
# more details.                                                               #
#                                                                             #
# You should have received a copy of the GNU Affero General Public License    #
# along with pms. If not, see <http://www.gnu.org/licenses/>.                 #
#                                                                             #
###############################################################################
#++

require 'pms/version'
require 'pms/index'
require 'pms/proxy'

class PMS

  attr_reader :input, :index

  def initialize(input, options = {})
    @input = input
    @index = Index.new(input, options)
  end

  def search(token = nil, &block)
    token ? TokenProxy.new(self, token) : Proxy.new(self).and(&block)
  end

  alias_method :/, :search

  def results
    @index.entries
  end

  def matches
    @index.matches
  end

end
