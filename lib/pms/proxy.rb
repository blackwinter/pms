#--
###############################################################################
#                                                                             #
# A component of pms, Poor Man's Search.                                      #
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

class PMS

  class Proxy

    attr_reader :pms, :index, :results

    def initialize(pms)
      @pms     = pms
      @index   = pms.index
      @results = pms.results
    end

    def and(token = nil)
      token ? apply_operator_with_token('and', token) :
              apply_operator_with_block('and') { |*a| yield(*a) }
    end

    def or(token = nil)
      token ? apply_operator_with_token('or', token) :
              apply_operator_with_block('or') { |*a| yield(*a) }
    end

    def not(token = nil)
      token ? apply_operator_with_token('not', token) :
              apply_operator_with_block('not') { |*a| yield(*a) }
    end

    def matches
      index.matches(results)
    end

    private

    def apply_operator_with_token(op, token)
      apply_operator(op, index.results(token))
    end

    def apply_operator_with_block(op)
      case sub = yield(pms)
        when Proxy
          apply_operator(op, sub.results)
        else
          raise "sub-query must return a PMS::Proxy object (got #{sub.class})"
      end
    end

    def apply_operator(op, doc_nums)
      case op = op.to_s.downcase
        when 'and'
          @results &= doc_nums
        when 'or'
          @results |= doc_nums
        when 'not'
          @results -= doc_nums
        else
          raise ArgumentError, "invalid operator '#{op}'"
      end

      self  # allow chaining!
    end

  end

  class TokenProxy < Proxy

    attr_reader :token, :results_with_positions

    def initialize(pms, token)
      super(pms)

      @token = token

      @results_with_positions = index.results_with_positions(token)
      @results = @results_with_positions.keys
    end

    def near(token, distance = 1, order = false)
      results1 = results_with_positions
      results2 = index.results_with_positions(token)

      doc_nums = results1.keys & results2.keys

      # TODO: i'm sure this can be simplified...
      doc_nums.delete_if { |doc_num|
        positions = results2[doc_num]

        !results1[doc_num].any? { |pos1|
          positions.find { |pos2|
            diff = pos2 - pos1

            break if order && diff < 0

            diff.abs <= distance
          }
        }
      }

      apply_operator('and', doc_nums)
    end

    def adjacent(token, distance = 1)
      near(token, distance, true)
    end

  end

end
