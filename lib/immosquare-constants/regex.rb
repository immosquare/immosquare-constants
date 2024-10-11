module ImmosquareConstants
  module Regex
    class << self

      ##============================================================##
      ## Explication de la nouvelle expression régulière :
      ## /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i
      ##   \A : Début de la chaîne.
      ##   [A-Z0-9._%+-]+ : Correspond à un ou plusieurs caractères autorisés dans la partie locale de l'adresse email (avant le @), y compris les lettres, les chiffres et les caractères spéciaux courants.
      ##   @ : Le symbole arobase séparant la partie locale du domaine.
      ##   [A-Z0-9.-]+ : Correspond à un ou plusieurs caractères autorisés dans le nom de domaine, y compris les lettres, les chiffres, les points et les tirets.
      ##   \. : Correspond à un point littéral . séparant le domaine de l'extension.
      ##   [A-Z]{2,} : Correspond à une extension de domaine composée d'au moins deux lettres (par exemple, com, org, net, fr).
      ##   \z : Fin de la chaîne.
      ##   /i : Modificateur rendant la correspondance insensible à la casse (majuscule/minuscule).
      def email
        /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\z/i
      end

      ##============================================================##
      ## Même expression régulière que ci-dessus, mais avec les
      ## délimiteurs de mots \b à la place des délimiteurs de chaîne
      ##============================================================##
      def email_in_string
        /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i
      end

    end
  end
end
