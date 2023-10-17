require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'with DB columns' do
    {
      rating: :integer,
      reviewer_id: :integer,
      reviewee_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
  context 'associations' do
    %i[
      reviewer
      reviewee
    ].each do |attribute|
      it { is_expected.to belong_to(attribute).class_name('User') }
    end
  end
end
