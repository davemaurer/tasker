class List < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :tasks, dependent: :destroy

  def self.completed
    where(archived: true)
  end

  def self.current
    where(archived: false)
  end

  def completed_tasks
    self.tasks.completed_tasks
  end

  def current_tasks
    self.tasks.current_tasks
  end
end
