%%{
  machine content_location;

  include rb_actions "rb_actions.rl";
  include rfc5322 "../../rfc5322.rl";

  main := content_location;
}%%

module Mail
  module Parsers
    module Ragel
      module ContentLocationMachine
        %%write data;

        def self.parse(data)
          # 5.1 Variables Used by Ragel
          p = 0
          eof = pe = data.length
          stack = []

          # Accumulates actions for our own parser
          actions = []

          %%write init;
          %%write exec;

          if p == eof && cs >= %%{ write first_final; }%%
            return actions, nil
          else
            return [], "Only able to parse up to #{data[0..p]}"
          end
        end
      end
    end
  end
end
