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
    it { is_expected.to }
  end
end
