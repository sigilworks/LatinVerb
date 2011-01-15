require 'latinverb/latinverb_validation'

# Generalized module for handling lingustics processing
module Lingustics
  # Generalized module for handling lingustics related to Latin
  module Latin
    # Generalized module for handling lingustics related to Latin's verbal aspects
    module Verb
      # Class that is used to model a Verb in Latin
      class LatinVerb
        include Linguistics::Latin::Verb::Validation
        def initialize(s)
          if s.class == Array
          elsif s.class == String
            puts "this is a #{self.class} with #{s}"
          end
        end
      end
    end
  end
end
