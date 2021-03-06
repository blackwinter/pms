#--
###############################################################################
#                                                                             #
# A component of pms, Poor Man's Search.                                      #
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

require 'pms'

module PMS::Ext

  def search(*args, &block)
    PMS.new(self).search(*args, &block)
  end

  alias_method :/, :search

  [String, IO, Array].each { |klass|
    klass.send(:include, self)
  }

end

class << File

  def search(file, *args, &block)
    file = file.path if file.respond_to?(:path)
    open(file) { |f| f.search(*args, &block) }
  end

end
