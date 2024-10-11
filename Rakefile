require "immosquare-constants"

namespace :immosquare_constants do
  namespace :sample do
    ##============================================================##
    ## bundle exec rake immosquare_constants:sample:ip:get_real_ip
    ##============================================================##
    namespace :ip do
      task :get_real_ip do
        ip = ImmosquareConstants::Ip.get_real_ip
        puts ip
      end
    end

    ##============================================================##
    ## bundle exec rake immosquare_constants:sample:locale:native_name_for_locale
    ##============================================================##
    namespace :locale do
      task :native_name_for_locale do
        locale      = :fr
        locale_name = ImmosquareConstants::Locale.native_name_for_locale(locale)
        puts locale_name
      end
    end


    namespace :regex do
      ##============================================================##
      ## bundle exec rake immosquare_constants:sample:regex:email
      ##============================================================##
      task :email do
        valid_emails = [
          "test@example.com",
          "user.name+tag+sorting@example.co.uk",
          "user_name@example-domain.com",
          "user-name@sub.example.com"
        ]
        invalid_emails = [
          "plainaddress",
          "@no-local-part.com",
          "Outlook Contact <outlook-contact@domain.com>",
          "no-at.domain.com",
          "a test@test.com",
          "test@test.com extra",
          "test@@example.com"
        ]
        (valid_emails + invalid_emails).each do |email|
          tester = ImmosquareConstants::Regex.email.match?(email)
          puts "Email: #{email} => #{tester}"
        end
      end

      ##============================================================##
      ## bundle exec rake immosquare_constants:sample:regex:email_in_string
      ##============================================================##
      task :email_in_string do
        text   = "Veuillez contacter support@example.com ou sales@example.org pour plus d'informations."
        emails = text.scan(ImmosquareConstants::Regex.email_in_string)
        puts "Adresses email trouvées : #{emails.join(", ")}" if emails.any?
      end
    end

    ##============================================================##
    ## bundle exec rake immosquare_constants:sample:color:color_name_to_hex
    ##============================================================##
    namespace :color do
      task :color_name_to_hex do
        color     = "red"
        color_hex = ImmosquareConstants::Color.color_name_to_hex(color)
        puts "#{color} => #{color_hex}"
      end
    end
  end
end
