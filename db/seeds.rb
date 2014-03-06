# encoding: utf-8

Revision.create!(
  name: "abc123",
  branch: "master",
  author: "Henrik Nyh and Victor Arias",
  url: "http://example.com/foo",
  message: "My message.",
  reviewed: false,
  payload: {},
)

Revision.create!(
  name: "123abc",
  branch: "master",
  author: "Joakim Kolsjö",
  url: "http://example.com/foo",
  message: "Do the thing.",
  reviewed: true,
  payload: {},
)
