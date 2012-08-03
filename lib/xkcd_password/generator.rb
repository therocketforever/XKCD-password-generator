module XkcdPassword

  class Generator
    attr_accessor :dictionary, :template
    def initialize(hash={})
      self.dictionary = {"word"=>XkcdPassword::Dictonary.default}
      self.template = hash[:template] || "word-word-word-word"
    end

    def generate
      password = self.template.gsub(/([a-z]+)/) do |word|
        self.pick(word)
      end
      raise XkcdPassword::EmptyTemplateException if password == template 
      password
    end

    def pick(type)
      raise XkcdPassword::DictionaryNotFoundException unless self.dictionary[type]
      self.dictionary[type].shuffle.first
    end

  end


  class DictionaryNotFoundException < Exception
  end

  class EmptyTemplateException < Exception
  end
end
