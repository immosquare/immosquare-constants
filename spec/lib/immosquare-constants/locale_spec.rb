require "spec_helper"

RSpec.describe(ImmosquareConstants::Locale) do
  describe ".native_name_for_locale" do
    context "with valid locales" do
      it "returns native name for French" do
        expect(described_class.native_name_for_locale(:fr)).to(eq("Français"))
        expect(described_class.native_name_for_locale("fr")).to(eq("Français"))
      end

      it "returns native name for English" do
        expect(described_class.native_name_for_locale(:en)).to(eq("English"))
        expect(described_class.native_name_for_locale("en")).to(eq("English"))
      end

      it "returns native name for Spanish" do
        expect(described_class.native_name_for_locale(:es)).to(eq("Español"))
        expect(described_class.native_name_for_locale("es")).to(eq("Español"))
      end

      it "returns native name for German" do
        expect(described_class.native_name_for_locale(:de)).to(eq("Deutsch"))
        expect(described_class.native_name_for_locale("de")).to(eq("Deutsch"))
      end

      it "returns native name for Italian" do
        expect(described_class.native_name_for_locale(:it)).to(eq("Italiano"))
        expect(described_class.native_name_for_locale("it")).to(eq("Italiano"))
      end
    end

    context "with invalid locales" do
      it "returns nil for unknown locale" do
        expect(described_class.native_name_for_locale(:xx)).to(be_nil)
        expect(described_class.native_name_for_locale("xx")).to(be_nil)
      end

      it "returns nil for nil" do
        expect(described_class.native_name_for_locale(nil)).to(be_nil)
      end

      it "returns nil for empty string" do
        expect(described_class.native_name_for_locale("")).to(be_nil)
      end
    end

    context "with edge cases" do
      it "handles uppercase locale codes" do
        expect(described_class.native_name_for_locale("FR")).to(eq("Français"))
        expect(described_class.native_name_for_locale("EN")).to(eq("English"))
      end

      it "handles mixed case locale codes" do
        expect(described_class.native_name_for_locale("Fr")).to(eq("Français"))
        expect(described_class.native_name_for_locale("En")).to(eq("English"))
      end
    end
  end

  describe ".languages_with_native_names" do
    it "returns a hash of locales and their native names" do
      result = described_class.languages_with_native_names
      expect(result).to(be_a(Hash))
      expect(result).not_to(be_empty)
    end

    it "includes common languages" do
      result = described_class.languages_with_native_names
      expect(result[:fr]).to(eq("Français"))
      expect(result[:en]).to(eq("English"))
      expect(result[:es]).to(eq("Español"))
      expect(result[:de]).to(eq("Deutsch"))
    end

    it "returns the same result for multiple calls" do
      first_call = described_class.languages_with_native_names
      second_call = described_class.languages_with_native_names
      expect(first_call).to(eq(second_call))
    end
  end
end
