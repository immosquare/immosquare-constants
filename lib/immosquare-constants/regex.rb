module ImmosquareConstants
  module Regex
    class << self

      def email
        /\A[^@\s]+@[^@\s]+\z/
      end

    end
  end
end
