class Task < ApplicationRecord
  belongs_to :project, optional: true

  enum status: { todo: 0, done: 1 }
end
