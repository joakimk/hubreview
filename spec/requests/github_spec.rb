require "spec_helper"

describe "Capturing revision data from github payloads" do
  it "works" do
    post "/github", payload: File.read("#{Rails.root}/spec/fixtures/github_payload.json")

    revision = Revision.last
    expect(revision.name).to eq("232e29976db07bc05124007ff11165b10c0ee65f")
    expect(revision.author).to match(/Joakim/)
    expect(revision.url).to match(/http/)
    expect(revision.message).to match(/Update/)
    expect(revision.payload["ref"]).to match(/master/)
  end
end
