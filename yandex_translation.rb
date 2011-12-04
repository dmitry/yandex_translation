%w(rubygems open-uri nokogiri cgi).each {|lib| require lib}

module Yandex
  class Translate
    class << self
      # language directions: en-ru-en de-ru-de fr-ru-fr it-ru-it es-ru-es uk-ru ru-uk kk-ru ru-kk la-ru-la
      def word(word, lang=nil)
        url = "http://m.slovari.yandex.ru/search.xml?text=#{CGI::escape(word)}"
        url << "&lang=#{lang}" if lang

        data = open(url).read
        xml = Nokogiri::HTML(data)

        {:translations => []}.tap do |r|
          r[:word] = xml.css('.b-title')[0].inner_text
          xml.css('.b-translate a').each do |v| r[:translations] << v.inner_text end
        end
      end

      # http://translate.yandex.ru/
      def text(text, lang)
        url = "http://translate.yandex.ru/tr.json/translate?text=#{CGI::escape(text)}"
        url << "&lang=#{lang}" if lang
        open(url).read[1..-2]
      end
    end
  end
end
