require 'rails_helper'

RSpec.describe UserFlashcard, type: :model do
  context 'with DB columns' do
    {
      user_id: :integer,
      translation_id: :integer,
      success_count: :integer,
      failed_count: :integer,
      category_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:category).class_name("Category") }
    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to belong_to(:translation).class_name("Translation") }
  end
end
