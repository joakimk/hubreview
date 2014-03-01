class PushRevisionChange
  def self.push(revision, controller)
    PushBackend.push({
      revision_id: revision.id,
      html: controller.render_to_string(
        partial: "revisions/revision",
        locals: { revision: revision }
      )
    })
  end
end
