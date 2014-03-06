require "spec_helper"

describe "Reviewing revisons" do
  it "can mark revisions as reviewed", :js do
    revision = create_revision name: "abc123abc123abc123"
    visit "/"

    expect(page).not_to have_reviewed_revisions

    click_button "Mark as reviewed"

    update_page
    expect(page).to have_reviewed_revisions
  end

  it "can mark revisions as new", :js do
    revision = create_revision name: "abc123abc123abc123", reviewed: true
    visit "/"

    expect(page).to have_reviewed_revisions

    click_button "Mark as new"

    update_page
    expect(page).not_to have_reviewed_revisions
  end

  it "marks revisions as in review for a while when you click on them", :js do
    revision = create_revision name: "abc123abc123abc123"

    visit "/"

    expect(page).not_to have_revision_in_review

    click_link "abc123"

    update_page
    expect(page).to have_revision_in_review
    expect(revision.reload.in_review_at).to be_within(3).of(Time.now)
  end

  it "does not mark reviewed revisions as in-review when you click on them", :js do
    revision = create_revision name: "abc123abc123abc123", reviewed: true

    visit "/"

    click_link "abc123"

    update_page
    expect(page).not_to have_revision_in_review
  end

  def update_page
    visit "/" # normally it updates by websockets
  end

  def have_revision_in_review
    have_selector(".revision.in-review")
  end

  def have_reviewed_revisions
    have_selector(".revision.was-reviewed")
  end

  def create_revision(opts = {})
    Revision.create!({ name: "abc123abc123abc123", branch: "master", author: "Joe", url: "http://example.org", message: "Message", payload: {} }.merge(opts))
  end
end
