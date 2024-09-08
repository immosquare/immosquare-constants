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

    ##============================================================##
    ## bundle exec rake immosquare_constants:sample:regex:email
    ##============================================================##
    namespace :regex do
      task :email do
        email  = "test@test.com"
        tester = ImmosquareConstants::Regex.email.match?(email)
        puts "Email: #{email} => #{tester}"
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
