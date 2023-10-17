require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'with DB columns' do
    {
      name: :string,
      default: :boolean
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
  context 'validations and associations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_inclusion_of(:default).in_array([true, false]) }
  end
end
