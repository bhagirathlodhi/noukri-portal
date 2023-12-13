require 'rails_helper'

# RSpec.describe User, type: :model do
#   context 'when create a user' do
#     let(:user) { build :user }

#     it 'should be valid user with all attributes' do 
#       expect(user.valid?).to eq(false)
#     end
#   end
# end


RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:jobs) } # Assuming User has_many :posts

  # Devise specific test cases
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }

  # Test for authentication
  describe "#authenticate" do
    let(:user) { build :user }
    # let(:user) { create(:user, password: "password123") }

    it "returns the user when the password is correct" do
      authenticated_user = user.authenticate("password123")
      expect(authenticated_user).to eq(user)
    end

    it "returns false when the password is incorrect" do
      authenticated_user = user.authenticate("wrong_password")
      expect(authenticated_user).to eq(false)
    end
  end
end
