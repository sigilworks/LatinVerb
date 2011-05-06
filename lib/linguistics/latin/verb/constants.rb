# encoding:  UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        # :stopdoc: 
        # active_present_endings: ("ap_"-prefixed)
          AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS = %w(s  t  mus  tis  nt)
          AP_THIRD_CONJUG_PERS_ENDINGS            = %w(ō  is it   imus itis unt)
          AP_THIRDIO_CONJG_PERS_ENDINGS           = %w(is it imus itis iunt)

        # active_imperfect_endings: ("ai_"-prefixed)
          AI_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS = %w(bam bās bat bāmus bātis bant)
          AI_THIRD_CONJUG_PERS_ENDINGS            = %w(ēbam ēbās ēbat ēbāmus ēbātis ēbant)

        # active_future_endings: ("af_"-prefixed)
          AF_ONE_TWO_ENDINGS = %w(bō bis bit bimus bitis bunt)
          AF_OTHER_ENDINGS   = %w(am ēs et ēmus ētis ent)

        # active_perfect_present: ("aperf"-prefixed)
          APERF_ENDINGS        = %w(istī it imus istis ērunt)
          APERF_PAST_ENDINGS   = PLUPERF_ENDINGS  =   
                                 %w(eram erās erat erāmus erātis erant)
          APERF_FUTURE_ENDINGS = %w(erō eris erit erimus eritis erint)

        # passive endings
          PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG = 
            %w(r ris tur mur minī ntur)
          PASSIVE_ENDINGS_OTHER                  =   
            %w(r eris itur imur iminī untur)

          PASS_PERF_PRESENT_ENDINGS = %w(sum es est sumus estis sunt)        
          PASS_PERF_PAST_ENDINGS    = %w(eram erās erat erāmus erātis erant)
          PASS_PERF_FUTURE_ENDINGS  = %w(erō eris erit erimus eritis erint)

          PASS_PERF_SUBJ_ENDINGS    = %w(sim sis sit simus sitis sint)        
          PASS_PLUPERF_PAST_ENDINGS = %w(essem essēs esset essēmus essētis essent)
              
        # subjunctive tools
          # hash for getting a verb's subjunctive stem
          # based off the W[e] F[ea]r [A] L[ia]r mnemonic
          ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS = { 
            :First   => lambda  { |x| return x + "ē"  },  
            :Second  => lambda  { |x| return x + "eā" },
            :Third   => lambda  { |x| return x + "ā"  },  
            :Fourth  => lambda  { |x| return x + "iā" },
            :ThirdIO => lambda  { |x| return x + "iā" }
          }   
        # :startdoc:
      end
    end
  end
end