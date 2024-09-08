require "socket"
require "net/http"
require "uri"

module ImmosquareConstants
  module Ip
    class << self

      ##============================================================##
      ## On récupère l'IP réelle
      ##============================================================##
      def get_real_ip
        begin
          begin
            uri = URI.parse("https://checkip.amazonaws.com/")
            response = Net::HTTP.get_response(uri)
            raise("No IP found") unless response.is_a?(Net::HTTPSuccess)

            response.body.strip
          rescue StandardError => e
            s  = Socket.ip_address_list.find(&:ipv4_private?)
            s  = Socket.ip_address_list.first if s.blank?
            raise("No IP found") if s.blank?

            s.ip_address
          end
        rescue StandardError => e
          "0.0.0.0"
        end
      end

    end
  end
end
