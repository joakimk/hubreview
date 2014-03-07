# encoding: utf-8

# Example data for dev.
if Rails.env.development?
  Revision.create!(
    name: "abc123abc123abc123",
    branch: "master",
    author: "Henrik Nyh and Victor Arias",
    author_email: "all+henrik+victor@barsoom.se",
    url: "http://example.com/foo",
    message: "My message.",
    reviewed: false,
    payload: {},
  )

  Revision.create!(
    name: "xyzabcxyzabcxyc",
    branch: "master",
    author: "Kim Persson",
    author_email: "kim@example.com",
    url: "http://example.com/foo",
    message: "What!",
    reviewed: true,
    payload: {},
  )

  Revision.create!(
    name: "123abc123abc123abc",
    branch: "master",
    author: "Joakim Kolsjö",
    author_email: "jocke@example.com",
    url: "http://example.com/foo",
    message: "Do the thing.\n\nSome details.",
    reviewed: true,
    payload: {},
  )
end
