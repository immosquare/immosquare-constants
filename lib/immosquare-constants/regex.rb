module ImmosquareConstants
  module Regex
    class << self

      ##============================================================##
      ## [A-Z0-9._%+-]+ : Correspond à un ou plusieurs caractères autorisés dans la partie locale de l'adresse email (avant le @), y compris les lettres, les chiffres et les caractères spéciaux courants.
      ## @ : Le symbole arobase séparant la partie locale du domaine.
      ## [A-Z0-9.-]+ : Correspond à un ou plusieurs caractères autorisés dans le nom de domaine, y compris les lettres, les chiffres, les points et les tirets.
      ## \. : Correspond à un point littéral . séparant le domaine de l'extension.
      ## [A-Z]{2,} : Correspond à une extension de domaine composée d'au moins deux lettres (par exemple, com, org, net, fr).
      ##============================================================##
      def email_raw
        /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i
      end

      ##============================================================##
      ## \A : Début de la chaîne.
      ## \z : Fin de la chaîne.
      ## /i : Modificateur rendant la correspondance insensible à la casse (majuscule/minuscule).
      ##============================================================##
      def email
        /\A#{email_raw.source}\z/i
      end

      ##============================================================##
      ## Même expression régulière que ci-dessus, mais avec les
      ## délimiteurs de mots \b à la place des délimiteurs de chaîne
      ##============================================================##
      def email_in_string
        /\b#{email_raw.source}\b/i
      end

    end
  end
end
