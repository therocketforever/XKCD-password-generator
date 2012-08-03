module XkcdPassword
  module Dictionary
    def self.default
      File.readlines(dictionary_path("5000-common-words.txt")).map(&:strip)
    end

    def self.dictionary_path(name)
      File.expand_path(File.join(File.dirname(__FILE__), "./../../dictionaries/", name))
    end
  end
end
