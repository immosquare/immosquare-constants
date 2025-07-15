require "spec_helper"

RSpec.describe ImmosquareConstants::Color do
  describe ".color_name_to_hex" do
    context "with valid color names" do
      it "returns hex for red" do
        expect(described_class.color_name_to_hex("red")).to eq("#ff0000")
        expect(described_class.color_name_to_hex(:red)).to eq("#ff0000")
      end

      it "returns hex for blue" do
        expect(described_class.color_name_to_hex("blue")).to eq("#0000ff")
        expect(described_class.color_name_to_hex(:blue)).to eq("#0000ff")
      end

      it "returns hex for green" do
        expect(described_class.color_name_to_hex("green")).to eq("#008000")
        expect(described_class.color_name_to_hex(:green)).to eq("#008000")
      end

      it "returns hex for black" do
        expect(described_class.color_name_to_hex("black")).to eq("#000000")
        expect(described_class.color_name_to_hex(:black)).to eq("#000000")
      end

      it "returns hex for white" do
        expect(described_class.color_name_to_hex("white")).to eq("#ffffff")
        expect(described_class.color_name_to_hex(:white)).to eq("#ffffff")
      end
    end

    context "with case variations" do
      it "handles uppercase color names" do
        expect(described_class.color_name_to_hex("RED")).to eq("#ff0000")
        expect(described_class.color_name_to_hex("BLUE")).to eq("#0000ff")
        expect(described_class.color_name_to_hex("GREEN")).to eq("#008000")
      end

      it "handles mixed case color names" do
        expect(described_class.color_name_to_hex("Red")).to eq("#ff0000")
        expect(described_class.color_name_to_hex("Blue")).to eq("#0000ff")
        expect(described_class.color_name_to_hex("Green")).to eq("#008000")
      end

      it "handles symbols with different cases" do
        expect(described_class.color_name_to_hex(:RED)).to eq("#ff0000")
        expect(described_class.color_name_to_hex(:Blue)).to eq("#0000ff")
        expect(described_class.color_name_to_hex(:GREEN)).to eq("#008000")
      end
    end

    context "with invalid color names" do
      it "returns nil for unknown color" do
        expect(described_class.color_name_to_hex("unknown")).to be_nil
        expect(described_class.color_name_to_hex(:unknown)).to be_nil
      end

      it "returns nil for nil input" do
        expect(described_class.color_name_to_hex(nil)).to be_nil
      end

      it "returns nil for empty string" do
        expect(described_class.color_name_to_hex("")).to be_nil
      end
    end

    context "with edge cases" do
      it "handles symbols and strings consistently" do
        expect(described_class.color_name_to_hex(:red)).to eq(described_class.color_name_to_hex("red"))
        expect(described_class.color_name_to_hex(:blue)).to eq(described_class.color_name_to_hex("blue"))
      end

      it "handles case variations consistently" do
        expect(described_class.color_name_to_hex("RED")).to eq(described_class.color_name_to_hex("red"))
        expect(described_class.color_name_to_hex("Blue")).to eq(described_class.color_name_to_hex("blue"))
        expect(described_class.color_name_to_hex(:GREEN)).to eq(described_class.color_name_to_hex("green"))
      end
    end
  end
end
