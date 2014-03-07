require "spec_helper"

describe "Capturing revision data from github payloads" do
  it "works" do
    post "/github", payload: File.read("#{Rails.root}/spec/fixtures/github_payload.json")

    revision = Revision.last
    expect(revision.name).to eq("232e29976db07bc05124007ff11165b10c0ee65f")
    expect(revision.author).to match(/Joakim/)
    expect(revision.author_email).to eq("foo@example.com")
    expect(revision.project_name).to eq("minimapper")
    expect(revision.url).to match(/http/)
    expect(revision.message).to match(/Update/)
    expect(revision.branch).to eq("master")
    expect(revision.payload["ref"]).to match(/master/)
  end

  it "does not create duplicates" do
    post "/github", payload: File.read("#{Rails.root}/spec/fixtures/github_payload.json")
    post "/github", payload: File.read("#{Rails.root}/spec/fixtures/github_payload.json")

    expect(Revision.count).to eq(1)
  end
end
