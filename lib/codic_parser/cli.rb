require "thor"

module CodicParser
  class CLI < Thor
    desc "get word", "request word for codic.jp"
    option :all, :type => :boolean, :aliases => :a
    option :nodesc,  :type => :boolean, :aliases => :l
    option :entryonly,  :type => :boolean, :aliases => :e
    def get(word)
      @parser = CodicParser::ParserFactory.get(word)

      if options[:entryonly]
        @parser.entry_list
        exit
      end

      @parser.word_list(options)

      if options[:all]
        @parser.all(options)
      end
    end

    desc "browse", "opened in a browser"
    def browse(word = nil)
      CodicParser::Browse.open(word)
    end
  end
end
