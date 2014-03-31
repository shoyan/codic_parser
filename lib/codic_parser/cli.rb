require "codic_parser"
require "thor"
require "nokogiri"
require "open-uri"

module CodicParser
  class CLI < Thor
    desc "get word", "request word for codic.jp"
    option :all, :type => :boolean, :aliases => :a
    option :nodesc,  :type => :boolean, :aliases => :n
    option :entryonly,  :type => :boolean, :aliases => :e
    def get(word)

      if /[a-zA-z0-9]/.match(word)

        @parser = CodicParser::Parser.new(word)

        if options[:entryonly]
          @parser.entry_list
          exit
        end

        @parser.word_list(options)

        if options[:all]
          @parser.all(options)
        end

      else

        @parser = CodicParser::MbParser.new(word)

        if options[:entryonly]
          @parser.entry_list
          exit
        end

        @parser.word_list

        if options[:all]
          @parser.all
        end
      end
    end

    desc "browse", "opened in a browser"
    def browse
      CodicParser::Browse.open
    end
  end
end
