class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :user

  def self.tagged_with(name)
    Tag.find_by!(name: name).events
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
