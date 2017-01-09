require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:user).counter_cache(:reviews_count) }
    it { is_expected.to belong_to(:book).counter_cache(:reviews_count) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:book_id) }
    it { is_expected.to validate_presence_of(:comment) }

    context 'uniqueness' do
      subject { build(:review) }
      it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:book_id) }
    end
  end

  describe '.get_reviews' do
    let(:book) { create(:book) }

    context 'reviewsテーブルのレコードが0件の場合' do
      it { expect(described_class.get_reviews(book).count).to eq 0 }
    end

    context 'reviewsテーブルにレコードが3件存在する場合' do
      let!(:first) { create(:review, book: book) }
      let!(:second) { create(:review, book: book) }
      let!(:third) { create(:review, book: book) }
      it { expect(described_class.get_reviews(book).count).to eq 3 }
      it { expect(described_class.get_reviews(book)).to eq [third, second, first] }
    end
  end

  describe '#register' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }
    let(:review) { book.reviews.build }

    context '正常終了の場合' do
      it do
        expect(review.register(user, 'Comment')).to eq true
        expect(review.user).to eq user
        expect(review.book).to eq book
        expect(review.comment).to eq 'Comment'
      end
    end

    context '異常終了の場合' do
      it { expect(review.register(user, nil)).to eq false }
    end
  end
end
