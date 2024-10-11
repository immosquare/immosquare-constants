module ImmosquareConstants
  module Regex
    class << self

      ##============================================================##
      ## Explication de la nouvelle expression régulière :
      ## /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i
      ##   \b : Assure que la correspondance se fait sur des limites de mots, évitant ainsi de capturer des adresses email qui font partie d'un mot plus long.
      ##   [A-Z0-9._%+-]+ : Correspond à un ou plusieurs caractères autorisés dans la partie locale de l'adresse email (avant le @), y compris les lettres, les chiffres et les caractères spéciaux courants.
      ##   @ : Le symbole arobase séparant la partie locale du domaine.
      ##   [A-Z0-9.-]+ : Correspond à un ou plusieurs caractères autorisés dans le nom de domaine, y compris les lettres, les chiffres, les points et les tirets.
      ##   \. : Correspond à un point littéral . séparant le domaine de l'extension.
      ##   [A-Z]{2,} : Correspond à une extension de domaine composée d'au moins deux lettres (par exemple, com, org, net, fr).
      ##   \b : Limite de mot à la fin pour s'assurer que l'extension de domaine est correctement terminée.
      ##   /i : Modificateur rendant la correspondance insensible à la casse (majuscule/minuscule).
      def email
        /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i
      end

    end
  end
end
