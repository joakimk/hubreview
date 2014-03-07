require "spec_helper"

describe Revision, "#message_summary" do
  context "with a one-paragraph message" do
    let(:revision) { Revision.new(message: "Hello\nWello") }

    it "is that paragraph" do
      expect(revision.message_summary).to eq "Hello\nWello"
    end
  end

  context "with a multi-paragraph message" do
    let(:revision) { Revision.new(message: "Hello\n\nWello\n\nGrello\nYello") }

    it "is the first paragraph" do
      expect(revision.message_summary).to eq "Hello"
    end
  end
end

describe Revision, "#message_details" do
  context "with a one-paragraph message" do
    let(:revision) { Revision.new(message: "Hello\nWello") }

    it "is nil" do
      expect(revision.message_details).to be_nil
    end
  end

  context "with a multi-paragraph message" do
    let(:revision) { Revision.new(message: "Hello\n\nWello\n\nGrello\nYello") }

    it "is every paragraph but the first" do
      expect(revision.message_details).to eq "Wello\n\nGrello\nYello"
    end
  end
end
