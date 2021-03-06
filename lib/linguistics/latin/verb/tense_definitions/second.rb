# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2 wrap:

module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module Second
          def active_voice_indicative_mood_future_tense
            return TenseBlock.new(
                [Linguistics::Latin::Verb::LatinVerb::AF_ONE_TWO_ENDINGS.collect{|x| stem + x}].flatten,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_indicative_mood_future_tense] }
              )
          end

          def active_voice_indicative_mood_imperfect_tense
            return TenseBlock.new(
              [Linguistics::Latin::Verb::LatinVerb::AI_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
              )
          end

          def active_voice_indicative_mood_present_tense
            return TenseBlock.new(
              [ first_person_singular,
                  Linguistics::Latin::Verb::LatinVerb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.collect{ |ending| stem + ending}
                 ].flatten!,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_indicative_mood_present_tense] }
              )
          end

          def active_voice_subjunctive_mood_present_tense
            key = verb_type.to_s.split(/::/).last.to_sym
            asp_base = Linguistics::Latin::Verb::LatinVerb::ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-2])
            elements = ['m',
               Linguistics::Latin::Verb::LatinVerb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending|
                 asp_base + ending
            end

            TenseBlock.new(
              elements,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_subjunctive_mood_present_tense] }
              )
          end

          def passive_voice_indicative_mood_future_tense
            fp_stem = stem+"bi"
            standards = Linguistics::Latin::Verb::LatinVerb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[2..-1].map{|x| fp_stem + x}
            standards.pop
            fp_stem.sub!(/.$/,'u')
            elements = [stem + "b\xc5\x8dr",
                        stem + "beris",
                        standards,
                        fp_stem+Linguistics::Latin::Verb::LatinVerb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.last].flatten!
            TenseBlock.new(
              elements,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_indicative_mood_future_tense] }
              )
          end

          def passive_voice_indicative_mood_imperfect_tense
            imperfect_stem = stem + "b\xc4\x81"
            elements = Linguistics::Latin::Verb::LatinVerb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| imperfect_stem+x}
            return TenseBlock.new(
              elements,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
              )
          end

          def passive_voice_indicative_mood_present_tense
            local_pe = Linguistics::Latin::Verb::LatinVerb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.clone
            elements = [first_person_singular.to_s + "r",
              local_pe[1..-1].map{|x| @stem + x}].flatten!
            return TenseBlock.new(
              elements,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_indicative_mood_present_tense] }
              )
          end

          def passive_voice_subjunctive_mood_present_tense
            key = verb_type.to_s.split(/::/).last.to_sym
            short_base =
              Linguistics::Latin::Verb::LatinVerb::ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-2])
            elems = Linguistics::Latin::Verb::LatinVerb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
               short_base + ending
            end
            TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_subjunctive_mood_present_tense] }
              )
          end
        end
      end
    end
  end
end

