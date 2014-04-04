require "thor"

module CodicParser
  class CLI < Thor
    desc "get word", "request word for codic.jp"
    option :all, :type => :boolean, :aliases => :a
    option :nodesc,  :type => :boolean, :aliases => :l
    option :entryonly,  :type => :boolean, :aliases => :e
    option :wordlist, :type => :boolean, :aliases => :w
    option :hidetranslation, :type => :boolean, :aliases => :h
    def get(word)
      @parser = CodicParser::ParserFactory.get(word)

      if options[:all]
        @parser.all(options)
        exit
      end

      if options[:entryonly]
        @parser.entry_list
      end

      if options[:wordlist]
        @parser.word_list(options)
      end

      unless options[:hidetranslation]
        @parser.translation(options)
      end
    end

    desc "browse", "opened in a browser"
    def browse(word = nil)
      CodicParser::Browse.open(word)
    end
  end
end
