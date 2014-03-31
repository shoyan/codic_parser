module CodicParser
  class Parser
    def initialize(word)
      @doc = Nokogiri::HTML(open("http://codic.jp/search?q=#{URI::encode(word)}&via=is"))
    end

    def word_list(options= {} )
      text = []
      desc = []

      @doc.css("#relations li a.seltext").each do |link|
        text.push(link.content)
      end
      @doc.css("#relations li span.digest").each do |link|
        desc.push(link.content)
      end

      text.each_index do |i|
        if options[:nodesc]
          puts "#{text[i]}"
        else
          puts "#{text[i]} / #{desc[i]}"
        end
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
