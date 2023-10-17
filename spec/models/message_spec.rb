require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'with DB columns' do
    it { is_expected.to have_db_column(:text).of_type :string }
  end
  context 'associations' do
    it { is_expected.to belong_to(:friend).class_name('Friend') }
  end
end
