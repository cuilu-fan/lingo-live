require 'rails_helper'

RSpec.describe Friend, type: :model do
  context 'with DB columns' do
    {
      user_1_id: :integer,
      user_2_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
  context 'associations' do
    [
      :user_1,
      :user_2
    ].each do |attribute|
      it { is_expected.to belong_to(attribute).class_name('User') }
    end
  end
end
