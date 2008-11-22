module Mail
  # Provides access to a structured header field
  #
  # ===Per RFC 2822:
  #  2.2.2. Structured Header Field Bodies
  #  
  #     Some field bodies in this standard have specific syntactical
  #     structure more restrictive than the unstructured field bodies
  #     described above. These are referred to as "structured" field bodies.
  #     Structured field bodies are sequences of specific lexical tokens as
  #     described in sections 3 and 4 of this standard.  Many of these tokens
  #     are allowed (according to their syntax) to be introduced or end with
  #     comments (as described in section 3.2.3) as well as the space (SP,
  #     ASCII value 32) and horizontal tab (HTAB, ASCII value 9) characters
  #     (together known as the white space characters, WSP), and those WSP
  #     characters are subject to header "folding" and "unfolding" as
  #     described in section 2.2.3.  Semantic analysis of structured field
  #     bodies is given along with their syntax.
  class StructuredField
    
    def initialize(raw_value, name, value = '')
      self.raw_value = raw_value
      self.name = name
      self.value = value
    end
    
    def raw_value=(value)
      @raw_value = value
    end
    
    def raw_value
      @raw_value
    end
    
    def name=(value)
      @name = value
    end
    
    def name
      @name
    end
    
    def value=(value)
      @value = value
    end
    
    def value
      @value
    end
    
    def to_s
      value.blank? ? '' : "#{name}: #{value}"
    end
    
    def encoded
      to_s.blank? ? nil : to_s
    end
    
  end
end
