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

class PMS

  class Index

    TOKEN_RE = %r{\w+}

    attr_reader :input, :index, :entries

    def initialize(input)
      raise ArgumentError, "input must implement #each" unless input.respond_to?(:each)

      @input = input
      build_index
    end

    def doc_nums_with_positions(token)
      case token
        when String
          index[mangle_token(token)]
        when Regexp
          res = {}

          index.each { |key, value|
            res.update(value) { |_, old, new| old | new } if key =~ token
          }

          res
        else
          raise TypeError, "expected String or Regexp, got #{token.class}"
      end
    end

    alias_method :results_with_positions, :doc_nums_with_positions

    def doc_nums(token)
      doc_nums_with_positions(token).keys
    end

    alias_method :results, :doc_nums

    def documents(doc_nums = default = Object.new)
      @documents ||= get_documents
      default ? @documents : @documents.values_at(*doc_nums)
    end

    alias_method :matches, :documents

    def doc(doc_num)
      documents([doc_num]).first
    end

    alias_method :[], :doc

    private

    def build_index
      @documents, @entries, doc_num = nil, [], -1
      index = Hash.new { |h, k| h[k] = Hash.new { |i, j| i[j] = [] } }

      input.each { |doc|
        @entries << doc_num += 1
        pos = -1

        doc.scan(TOKEN_RE) { |token|
          index[mangle_token(token)][doc_num] << pos += 1
        }
      }

      @index = index
    end

    def get_documents
      input.rewind if input.respond_to?(:rewind)

      docs = []
      input.each { |doc| docs << doc }
      docs
    end

    def mangle_token(token)
      token.downcase
    end

  end

end
