require "socket"
require "net/http"
require "uri"
require "json"

module ImmosquareConstants
  module Ip
    ##============================================================##
    ## Simple class to provide dot notation access to IP addresses
    ##============================================================##
    class IpResult

      attr_reader :local, :client

      def initialize(local_ip, client_ip)
        @local = local_ip
        @client = client_ip
      end

      def to_json(*)
        {
          :local  => @local,
          :client => @client
        }.to_json(*)
      end

      def to_hash
        {
          :local  => @local,
          :client => @client
        }
      end

      def to_s
        "local: #{@local}, client: #{@client}"
      end

      def inspect
        "#<ImmosquareConstants::Ip::IpResult local: #{@local.inspect}, client: #{@client.inspect}>"
      end

      def to_a
        [@local, @client]
      end

      def to_h
        to_hash
      end

    end

    class << self

      ##============================================================##
      ## Method to get the public IP address used to access the internet
      ##============================================================##
      def get_my_ip_from_aws
        get_public_ip_from_aws
      end

      ##============================================================##
      ## Method to get available IP addresses
      ##============================================================##
      def get_ips(request = nil)
        IpResult.new(
          get_local_ip,
          get_client_ip(request)
        )
      end

      private

      ##============================================================##
      ## Use a Socket to get the local IP address
      ## by connecting to Google's DNS server
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
      ## Get client IP with intelligent proxy handling
      ## IP retrieval hierarchy (from most reliable to least reliable):
      ## 1. HTTP_X_REAL_IP : Custom header often set by load balancers/proxies
      ## 2. request.ip : Rails intelligent method that analyzes X-Forwarded-For, X-Real-IP, etc.
      ## 3. request.remote_ip : Direct connection IP (might be proxy IP)
      ##
      ## Example: Client (203.0.113.1) → Proxy (10.0.0.1) → Rails Server
      ## - request.remote_ip would return 10.0.0.1 (proxy)
      ## - request.ip would return 203.0.113.1 (real client)
      ## - HTTP_X_REAL_IP might contain 203.0.113.1 if set by proxy
      ##============================================================##
      def get_client_ip(request = nil)
        begin
          raise("No request provided") if request.nil?

          ip = request.env["HTTP_X_REAL_IP"] || request.ip || request.remote_ip
          raise("No IP found") if ip.nil?
          raise("IP is localhost (127.0.0.1)") if ip == "127.0.0.1"

          ip
        rescue StandardError => e
          get_public_ip_from_aws
        end
      end

      ##============================================================##
      ## Get public IP address with fallback (for production)
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
