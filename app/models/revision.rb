class Revision < ActiveRecord::Base
  serialize :payload

  def short_name
    name.first(10)
  end
end
