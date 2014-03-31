module CodicParser
  class MbParser
    def initialize(word)
      @doc = Nokogiri::HTML(open("http://codic.jp/search?q=#{URI::encode(word)}&via=is"))
    end

    def word_list(options = {})
      @doc.css('.translation .post a').each do |link|
        puts link.content
      end
    end

    def entry_list
      @doc.css('section.entry-list li').each do |link|
        puts link.content
      end
    end

    def all(options = {})
      self.word_list(options)
      self.entry_list
    end
  end
end
