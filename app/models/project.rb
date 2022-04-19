class Project < ApplicationRecord
  has_many :tasks

  def as_json(options = {})
    super({
      methods: [:tasks]
    }.merge(options))
  end
end
