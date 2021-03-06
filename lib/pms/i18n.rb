#--
###############################################################################
#                                                                             #
# A component of pms, Poor Man's Search.                                      #
#                                                                             #
# Copyright (C) 2008-2014 Jens Wille                                          #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@gmail.com>                                       #
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

require 'nuggets/i18n'
require 'pms'

class PMS

  module I18n

    def mangle_token(token)
      super.tap(&:replace_diacritics!)
    end

  end

  Index.prepend(I18n)

end
