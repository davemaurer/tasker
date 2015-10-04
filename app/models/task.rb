class Task < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :list

  def self.completed_tasks
    where(status: 'completed')
  end

  def self.current_tasks
    where(status: 'incomplete')
  end
end
