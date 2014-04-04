module CodicParser
  class Parser
    def initialize(word)
      @doc = Nokogiri::HTML(open("http://codic.jp/search?q=#{URI::encode(word)}&via=is"))
    end

    def translation(options= {} )
      numbers = []
      words   = []
      translations = []

      @doc.css("#translations li .no").each do |link|
        numbers.push(link.content)
      end

      @doc.css("#translations li .word-class").each do |link|
        words.push(link.content)
      end

      @doc.css("#translations li .translated").each do |link|
        translations.push(link.content)
      end

      numbers.each_index do |i|
        puts "#{numbers[i]} #{words[i]} #{translations[i]}"
      end
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

      text.uniq!
      desc.uniq!

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
      self.translation
      self.word_list(options)
      self.entry_list
    end
  end
end
