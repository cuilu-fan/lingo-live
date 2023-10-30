require 'rails_helper'

RSpec.describe Friend, type: :model do
  context 'with DB columns' do
    {
      friend_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
end
