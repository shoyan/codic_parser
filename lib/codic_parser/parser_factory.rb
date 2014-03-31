require "codic_parser/parser/parser.rb"
require "codic_parser/parser/mb_parser.rb"

module CodicParser
  class ParserFactory
    def self.get(word)
      if /[a-zA-z0-9]/.match(word)
        CodicParser::Parser.new(word)
      else
        CodicParser::MbParser.new(word)
      end
    end
  end
end
