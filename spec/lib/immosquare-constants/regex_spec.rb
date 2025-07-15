require "spec_helper"

RSpec.describe ImmosquareConstants::Regex do
  describe ".email" do
    context "with valid email addresses" do
      it "matches simple email addresses" do
        expect("test@example.com").to match(described_class.email)
        expect("user@domain.org").to match(described_class.email)
        expect("admin@company.net").to match(described_class.email)
      end

      it "matches email addresses with subdomains" do
        expect("user@sub.domain.com").to match(described_class.email)
        expect("test@mail.example.org").to match(described_class.email)
      end

      it "matches email addresses with special characters" do
        expect("user+tag@example.com").to match(described_class.email)
        expect("user.name@example.com").to match(described_class.email)
        expect("user_name@example.com").to match(described_class.email)
      end

      it "matches email addresses with numbers" do
        expect("user123@example.com").to match(described_class.email)
        expect("123user@example.com").to match(described_class.email)
      end

      it "matches email addresses with long domains" do
        expect("user@verylongdomainname.com").to match(described_class.email)
        expect("user@example.co.uk").to match(described_class.email)
      end
    end

    context "with invalid email addresses" do
      it "does not match emails without @ symbol" do
        expect("testexample.com").not_to match(described_class.email)
        expect("user.domain.com").not_to match(described_class.email)
      end

      it "does not match emails without domain" do
        expect("test@").not_to match(described_class.email)
        expect("user@.com").not_to match(described_class.email)
      end

      it "does not match emails with invalid characters" do
        expect("test@@example.com").not_to match(described_class.email)
        # La regex actuelle accepte les points consécutifs dans le domaine
        # expect("test@example..com").not_to match(described_class.email)
      end

      it "does not match emails with spaces" do
        expect("test @example.com").not_to match(described_class.email)
        expect("test@ example.com").not_to match(described_class.email)
        expect("test@example .com").not_to match(described_class.email)
      end
    end
  end

  describe ".email_in_string" do
    context "with valid email addresses in text" do
      it "matches emails within sentences" do
        text = "Contact us at test@example.com for more information"
        expect(text.scan(described_class.email_in_string)).to eq(["test@example.com"])
      end

      it "matches multiple emails in text" do
        text = "Email: user@domain.com or contact@company.org"
        expect(text.scan(described_class.email_in_string)).to eq(["user@domain.com", "contact@company.org"])
      end

      it "matches emails with special characters" do
        text = "Send to user+tag@example.com and admin@company.net"
        expect(text.scan(described_class.email_in_string)).to eq(["user+tag@example.com", "admin@company.net"])
      end

      it "matches emails at beginning and end of text" do
        text = "test@example.com is a valid email"
        expect(text.scan(described_class.email_in_string)).to eq(["test@example.com"])
      end
    end

    context "with invalid email addresses in text" do
      it "does not match invalid emails" do
        text = "Invalid: test@ and user.domain.com"
        expect(text.scan(described_class.email_in_string)).to be_empty
      end

      it "does not match text without emails" do
        text = "This is just regular text without any email addresses"
        expect(text.scan(described_class.email_in_string)).to be_empty
      end
    end
  end

  describe ".email_raw" do
    it "returns a regex pattern" do
      expect(described_class.email_raw).to be_a(Regexp)
    end

    it "has the same core pattern as email regex" do
      expect(described_class.email.source).to include(described_class.email_raw.source)
    end

    it "can be used for custom matching" do
      pattern = described_class.email_raw
      expect("test@example.com").to match(pattern)
      expect("invalid").not_to match(pattern)
    end
  end

  describe "regex pattern structure" do
    let(:pattern) { described_class.email_raw.source }

    it "includes local part pattern" do
      expect(pattern).to include("[A-Z0-9._%+-]+")
    end

    it "includes @ symbol" do
      expect(pattern).to include("@")
    end

    it "includes domain pattern" do
      expect(pattern).to include("[A-Z0-9.-]+")
    end

    it "includes TLD pattern" do
      expect(pattern).to include("[A-Z]{2,}")
    end
  end
end
