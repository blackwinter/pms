#--
###############################################################################
#                                                                             #
# A component of pms, Poor Man's Search.                                      #
#                                                                             #
# Copyright (C) 2008-2010 Jens Wille                                          #
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

    def matches
      index.matches(results)
    end

    %w[and or not].each { |op| class_eval %Q{
      def #{op}(token = nil, &block)
        token ? apply_operator_with_token(#{op.inspect}, token) :
                apply_operator_with_block(#{op.inspect}, &block)
      end
    } }

    alias_method :&, :and
    alias_method :|, :or
    alias_method :-, :not

    private

    def apply_operator_with_token(op, token)
      apply_operator(op, index.results(token))
    end

    def apply_operator_with_block(op)
      case sub = yield(pms)
        when Proxy then apply_operator(op, sub.results)
        else raise "sub-query must return a #{Proxy} object (got #{sub.class})"
      end
    end

    def apply_operator(op, doc_nums)
      results = self.results

      case op = op.to_s.downcase
        when 'and' then results &= doc_nums
        when 'or'  then results |= doc_nums
        when 'not' then results -= doc_nums
        else raise ArgumentError, "invalid operator `#{op}'"
      end

      clone_with_results(results)  # allow chaining!
    end

    def clone_with_results(results)
      clone = self.clone
      clone.instance_variable_set(:@results, results)
      clone
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

    alias_method :%, :near

    def adjacent(token, distance = 1)
      near(token, distance, true)
    end

    alias_method :adj, :adjacent
    alias_method :^, :adjacent

  end

end
