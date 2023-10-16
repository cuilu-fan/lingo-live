require 'rails_helper'

RSpec.describe Review, type: :model do
  # Test the columns in the db
  it { should have_db_column(:id) }
  it { should have_db_column(:rating) }
  it { should have_db_column(:reviewer_id) }
  it { should have_db_column(:reviewee_id) }

  # Test the validations and relations
  it { should belong_to(:reviewer) }
  it { should belong_to(:reviewee) }
end
