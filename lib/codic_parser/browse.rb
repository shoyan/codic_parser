module CodicParser
  class Browse
    def self.open(word = nil)
      if word
        system("open http://codic.jp/search?q=#{word}&via=is")
      else
        system('open http://codic.jp')
      end
    end
  end
end
