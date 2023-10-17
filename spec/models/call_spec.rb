require 'rails_helper'

RSpec.describe Call, type: :model do
  context 'with DB columns' do
    it { is_expected.to have_db_column(:duration).of_type :integer }
  end
end
