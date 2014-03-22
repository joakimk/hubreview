class Revision < ActiveRecord::Base
  serialize :payload

  scope :newest_first, -> { order("id DESC") }

  def short_name
    name.first(10)
  end

  def message_summary
    message_parts.first
  end

  def message_details
    message_parts.last
  end

  def toggle_reviewed_state
    self.reviewed = !reviewed?
  end

  private

  def message_parts
    message.split("\n\n", 2).values_at(0, 1)
  end
end
