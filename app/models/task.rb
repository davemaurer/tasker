class Task < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :list
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def self.completed_tasks
    where(status: 'completed')
  end

  def self.current_tasks
    where(status: 'incomplete')
  end

  def tag_list
    self.tags.map do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tags = tags_string.split(",").map { |string| string.strip.downcase}.uniq
    new_or_found_tags = tags.map do |name|
      Tag.where(name: name).first_or_create
    end
    self.tags = new_or_found_tags
  end
end
