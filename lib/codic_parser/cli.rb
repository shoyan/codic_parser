require "codic_parser"
require "thor"
require "nokogiri"
require "open-uri"

module CodicParser
  class CLI < Thor
    desc "get word", "request word for codic.jp"
    option :all, :type => :boolean
    def get(word)
      text = []
      desc = []


      doc = Nokogiri::HTML(open("http://codic.jp/search?q=#{URI::encode(word)}&via=is"))
      if /[a-zA-z0-9]/.match(word)

        doc.css("#relations li a.seltext").each do |link|
          text.push(link.content)
        end
        doc.css("#relations li span.digest").each do |link|
          desc.push(link.content)
        end

        text.each_index do |i|
          puts "#{text[i]} / #{desc[i]}"
        end

        if options[:all]
          doc.css('section.entry-list li').each do |link|
            puts link.content
          end
        end
      else

        doc.css('.translation .post a').each do |link|
          puts link.content
        end

        if options[:all]
          doc.css('section.entry-list li').each do |link|
            puts link.content
          end
        end
      end
    end

    desc "browse", "opened in a browser"
    def browse
      system('open http://codic.jp')
    end
  end
end
