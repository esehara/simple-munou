require "simple_munou/version"

class Array
  def to_munou
    SimpleMunou::Brain.new self
  end
end

module SimpleMunou
  class Brain
    attr_reader :words
    def initialize(talk_pattern)
      @pattern = talk_pattern
    end

    def words=(words)
      @words = words.map do |elem|
        word = case elem
               when String then
                 SimpleMunou::Word.new(elem, 0)
               when Array then        
                 if (elem.size == 2) && (valid_word_array?(elem))
                   SimpleMunou::Word.new(elem[0], elem[1])
                 end
               when SimpleMunou::Word
                 elem
               end
        if word.nil?
          fail TypeError, "Not Support Type" 
        end
        word
      end
    end

    def say
      @variables = {}
      @pattern.map do |p|
        case p
        when Fixnum
          choice_words p
        when Symbol
          key, kind_num = p.to_s.split("_")
          if value = @variables[key]
            value
          else
            @variables[key] = choice_words kind_num.to_i
          end
        when String
          p
        end
      end.join
    end

    def valid_words(kind_num)
      kind_num > 0 ? @words.select {|word| word.kind == kind_num} : @words
    end
    
    private
    def choice_words(kind_num)
      valid_words(kind_num).sample
    end

    def valid_word_array?(elem)
      (elem[0].class == String) and (elem[1].class == Fixnum)
    end
  end

  class Word
    attr_reader :kind
    def initialize(word, kind=0)
      @kind = kind
      @word = word
    end

    def to_s
      @word
    end
  end
end
