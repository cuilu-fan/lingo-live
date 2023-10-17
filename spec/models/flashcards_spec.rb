require 'rails_helper'

RSpec.describe Flashcard, type: :model do
  context 'with DB columns' do
    {
      primary_language_word: :string,
      target_language_word: :string,
      default: :boolean
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type(type) }
    end
  end

  context 'validations and associations' do
    it { is_expected.to validate_presence_of(:primary_language_word) }
    it { is_expected.to validate_presence_of(:target_language_word) }
    it { is_expected.to validate_inclusion_of(:default).in_array([true, false]) }
    # What happend with default: and in that case what is default
  end
end
