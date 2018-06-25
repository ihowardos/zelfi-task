class EventDecorator < ApplicationDecorator
  delegate :id, :title, :description, :photo, :tag_list, :author_full_name

  def clickable_tags
    object.tags.map(&:name).map do |tag|
      h.link_to tag, h.root_path(tag: tag)
    end.join(', ')
  end

  def author_full_name
    object.user.full_name
  end
end
