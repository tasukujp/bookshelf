require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:user_books) }
    it { is_expected.to have_many(:books).through(:user_books) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:review_books).through(:reviews) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:name).is_at_least(4).is_at_most(16) }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to allow_value('abc@example.com').for :email }
    it { is_expected.not_to allow_value('abc').for :email }

    context 'uniqueness' do
      subject { build(:user) }
      it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end
  end
end
