require "spec_helper"

describe "Reviewing revisons" do
  it "can mark revisions as reviewed"
  it "can mark revisions as new"

  it "marks revisions as in review for a while when you click on them", :js do
    revision = Revision.create! name: "abc123abc123abc123", branch: "master", author: "Joe", url: "http://example.org", message: "Message", payload: {}

    visit "/"

    expect(page).to have_content("abc123")

    click_link "abc123"
    expect(page).not_to have_selector(".revision.in-review")

    visit "/" # normally it updates by websockets

    expect(page).to have_selector(".revision.in-review")
    expect(revision.reload.in_review_at).to be_within(3).of(Time.now)
  end
end
