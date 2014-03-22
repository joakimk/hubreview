require "digest/md5"

module Gravatar
  def self.url_from_email(email)
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
