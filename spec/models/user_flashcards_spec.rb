require 'rails_helper'

RSpec.describe UserFlashcard, type: :model do
  context 'with DB columns' do
    {
      user_id: :integer,
      flashcard_id: :integer,
      success: :boolean,
      failed: :boolean,
      category_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:category).class_name("Category") }
    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to belong_to(:flashcard).class_name("Flashcard") }
  end

  context 'validations' do
    it { is_expected.to validate_inclusion_of(:success).in_array([true, false]) }
    it { is_expected.to validate_inclusion_of(:failed).in_array([true, false]) }
  end
end
