require 'rails_helper'

RSpec.describe Call, type: :model do
  context 'with DB columns' do
    it { is_expected.to have_db_column(:duration).of_type :integer }
  end
  context "associations" do
    it { is_expected.to belong_to(:caller).class_name("User") }
    it { is_expected.to belong_to(:random_user).class_name("User") }
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:duration) }
  end
end
