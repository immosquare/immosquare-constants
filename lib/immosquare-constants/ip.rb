require "socket"
require "net/http"
require "uri"
require "ostruct"

module ImmosquareConstants
  module Ip
    class << self

      ##============================================================##
      ## Méthode pour récupérer l'IP publique : DEPRECATED
      ##============================================================##
      def get_real_ip
        get_public_ip_from_aws
      end

      ##============================================================##
      ## Méthode pour récupérer les IPs disponibles
      ##============================================================##
      def get_ips(request = nil)
        OpenStruct.new(
          :local  => get_local_ip,
          :client => defined?(Rails) && Rails.env.development? && !request.nil? ? get_client_ip(request) : get_public_ip_from_aws
        )
      end

      private

      ##============================================================##
      ## On utilise un Socket pour obtenir l'IP locale
      ## en se connectant à au DNS Google
      ##============================================================##
      def get_local_ip
        local_ip = nil
        begin
          socket = Socket.new(Socket::AF_INET, Socket::SOCK_DGRAM)
          socket.connect(Addrinfo.tcp("8.8.8.8", 53))
          local_ip = socket.local_address.ip_address
          socket.close
        rescue StandardError => e
          puts("Error getting local IP: #{e.message}")
        ensure
          return local_ip
        end
      end

      ##============================================================##
      ## On récupère l'IP client avec gestion intelligente des proxies
      ## Hiérarchie de récupération d'IP (du plus fiable au moins fiable) :
      ## 1. HTTP_X_REAL_IP : En-tête personnalisé souvent défini par les load balancers/proxies
      ## 2. request.ip : Méthode Rails intelligente qui analyse X-Forwarded-For, X-Real-IP, etc.
      ## 3. request.remote_ip : IP directe de la connexion (peut être l'IP du proxy)
      ##
      ## Exemple : Client (203.0.113.1) → Proxy (10.0.0.1) → Rails Server
      ## - request.remote_ip retournerait 10.0.0.1 (proxy)
      ## - request.ip retournerait 203.0.113.1 (client réel)
      ## - HTTP_X_REAL_IP pourrait contenir 203.0.113.1 si défini par le proxy
      ##============================================================##
      def get_client_ip(request)
        ip = request.env["HTTP_X_REAL_IP"] || request.ip || request.remote_ip
        ip.nil? ? get_public_ip_from_aws : ip
      end

      ##============================================================##
      ## On récupère l'IP publique avec fallback (pour production)
      ##============================================================##
      def get_public_ip_from_aws
        begin
          begin
            uri = URI.parse("https://checkip.amazonaws.com/")
            response = Net::HTTP.get_response(uri)
            raise("No IP found") unless response.is_a?(Net::HTTPSuccess)

            response.body.strip
          rescue StandardError => e
            s  = Socket.ip_address_list.find(&:ipv4_private?)
            s  = Socket.ip_address_list.first if s.nil?
            raise("No IP found") if s.nil?

            s.ip_address
          end
        rescue StandardError => e
          "0.0.0.0"
        end
      end


    end
  end
end
