module XkcdPassword
  module Dictonary
    def self.default
      File.readlines("/usr/share/dict/words").map(&:strip)
    end
  end
end
