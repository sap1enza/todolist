require "rails_helper"

RSpec.describe Task, type: :model do
  describe "associations" do
    it { should belong_to(:project).optional(true) }
  end

  describe "enum" do
    it { should define_enum_for(:status).with_values([:todo, :done]) }
  end
end
