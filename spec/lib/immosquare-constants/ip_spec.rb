require "spec_helper"

RSpec.describe(ImmosquareConstants::Ip) do
  describe ".get_my_ip_from_aws" do
    it "returns a valid IP address" do
      ip = described_class.get_my_ip_from_aws
      expect(ip).to(be_a(String))
      expect(ip).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
    end

    it "does not return localhost" do
      ip = described_class.get_my_ip_from_aws
      expect(ip).not_to(eq("127.0.0.1"))
    end
  end

  describe ".get_ips" do
    context "when request is provided" do
      let(:mock_request) do
        double("request",
          :env       => {"HTTP_X_REAL_IP" => "203.0.113.1"},
          :ip        => "203.0.113.2",
          :remote_ip => "203.0.113.3")
      end

      it "returns an IpResult object" do
        result = described_class.get_ips(mock_request)
        expect(result).to(be_a(ImmosquareConstants::Ip::IpResult))
      end

      it "has local, public and client attributes" do
        result = described_class.get_ips(mock_request)
        expect(result).to(respond_to(:local))
        expect(result).to(respond_to(:public))
        expect(result).to(respond_to(:client))
      end

      it "returns valid IP addresses" do
        result = described_class.get_ips(mock_request)
        expect(result.local).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
        expect(result.public).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
        expect(result.client).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
      end

      it "prioritizes HTTP_X_REAL_IP header" do
        result = described_class.get_ips(mock_request)
        expect(result.client).to(eq("203.0.113.1"))
      end
    end

    context "when request is nil" do
      it "returns an IpResult object" do
        result = described_class.get_ips(nil)
        expect(result).to(be_a(ImmosquareConstants::Ip::IpResult))
      end

      it "falls back to AWS IP for client" do
        result = described_class.get_ips(nil)
        expect(result.client).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
      end
    end

    context "when request has no HTTP_X_REAL_IP" do
      let(:mock_request) do
        double("request",
          :env       => {},
          :ip        => "203.0.113.2",
          :remote_ip => "203.0.113.3")
      end

      it "uses request.ip as fallback" do
        result = described_class.get_ips(mock_request)
        expect(result.client).to(eq("203.0.113.2"))
      end
    end

    context "when request.ip is nil" do
      let(:mock_request) do
        double("request",
          :env       => {},
          :ip        => nil,
          :remote_ip => "203.0.113.3")
      end

      it "uses request.remote_ip as fallback" do
        result = described_class.get_ips(mock_request)
        expect(result.client).to(eq("203.0.113.3"))
      end
    end

    context "when all request methods return nil" do
      let(:mock_request) do
        double("request",
          :env       => {},
          :ip        => nil,
          :remote_ip => nil)
      end

      it "falls back to AWS IP" do
        result = described_class.get_ips(mock_request)
        expect(result.client).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
      end
    end

    context "when request IP is localhost" do
      let(:mock_request) do
        double("request",
          :env       => {},
          :ip        => "127.0.0.1",
          :remote_ip => "127.0.0.1")
      end

      it "falls back to AWS IP" do
        result = described_class.get_ips(mock_request)
        expect(result.client).to(match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/))
        expect(result.client).not_to(eq("127.0.0.1"))
      end
    end
  end

  describe "IpResult" do
    let(:ip_result) { ImmosquareConstants::Ip::IpResult.new("192.168.1.100", "203.0.113.1", "10.0.0.1") }

    describe "#to_json" do
      it "returns valid JSON" do
        json = ip_result.to_json
        expect { JSON.parse(json) }.not_to(raise_error)
      end

      it "contains local, public and client IPs" do
        json = JSON.parse(ip_result.to_json)
        expect(json["local"]).to(eq("192.168.1.100"))
        expect(json["public"]).to(eq("203.0.113.1"))
        expect(json["client"]).to(eq("10.0.0.1"))
      end
    end

    describe "#to_hash" do
      it "returns a hash with local, public and client keys" do
        hash = ip_result.to_hash
        expect(hash).to(eq(:local => "192.168.1.100", :public => "203.0.113.1", :client => "10.0.0.1"))
      end
    end

    describe "#to_h" do
      it "returns the same as to_hash" do
        expect(ip_result.to_h).to(eq(ip_result.to_hash))
      end
    end

    describe "#to_s" do
      it "returns a readable string" do
        expect(ip_result.to_s).to(eq("local: 192.168.1.100, public: 203.0.113.1, client: 10.0.0.1"))
      end
    end

    describe "#to_a" do
      it "returns an array with local, public and client IPs" do
        expect(ip_result.to_a).to(eq(["192.168.1.100", "203.0.113.1", "10.0.0.1"]))
      end
    end

    describe "#inspect" do
      it "returns a detailed representation" do
        expect(ip_result.inspect).to(include("ImmosquareConstants::Ip::IpResult"))
        expect(ip_result.inspect).to(include("192.168.1.100"))
        expect(ip_result.inspect).to(include("203.0.113.1"))
        expect(ip_result.inspect).to(include("10.0.0.1"))
      end
    end

    describe "attribute accessors" do
      it "allows access to local IP" do
        expect(ip_result.local).to(eq("192.168.1.100"))
      end

      it "allows access to public IP" do
        expect(ip_result.public).to(eq("203.0.113.1"))
      end

      it "allows access to client IP" do
        expect(ip_result.client).to(eq("10.0.0.1"))
      end
    end
  end
end
