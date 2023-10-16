require 'rails_helper'

RSpec.describe Message, type: :model do
  # Test the columns in the db
  it { should have_db_column(:id) }
  it { should have_db_column(:text) }
  it { should have_db_column(:friend_id) }

  # Test the validations and relations
  it { should belong_to(:friend) }
end
