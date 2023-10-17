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

  context 'validations and associations' do
    it { is_expected.to belong_to(:category).class_name("Category") }
    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to belong_to(:flashcard).class_name("Flashcard") }

  end
end
