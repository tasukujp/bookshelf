require 'rails_helper'

RSpec.describe UserBook, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:user).counter_cache(:books_count) }
    it { is_expected.to belong_to(:book).counter_cache(:users_count) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:book_id) }
    it { is_expected.to validate_presence_of(:rental_date) }
    it { is_expected.to validate_presence_of(:due_date) }
  end

  describe '.get_rental_history' do
    let(:user) { create(:user) }
    context 'user_booksテーブルにレコードが0件の場合' do
      it { expect(described_class.get_rental_history(user).count).to eq 0 }
    end
    context 'user_booksテーブルにレコードが3件存在する場合' do
      let!(:first) { create(:user_book, user: user, rental_date: '2017-01-01 09:00:00') }
      let!(:second) { create(:user_book, user: user, rental_date: '2017-01-02 09:00:00') }
      let!(:third) { create(:user_book, user: user, rental_date: '2017-01-03 09:00:00') }
      it { expect(described_class.get_rental_history(user).count).to eq 3 }
      it { expect(described_class.get_rental_history(user)).to eq [third, second, first] }
    end
  end

  describe '#register' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }
    context '正常終了の場合' do
      it do
        user_book = book.user_books.build
        expect(user_book.register(user)).to eq true
        expect(user_book.user).to eq user
        expect(user_book.rental_date.since(7.days).end_of_day).to eq user_book.due_date
        expect(user_book.due_date.strftime('%H:%M:%S')).to eq '23:59:59'
        expect(user_book.return_date).to be_nil
      end
    end
    context '異常終了の場合' do
      it do
        user_book = book.user_books.build
        expect(user_book.register(User.new)).to eq false
      end
    end
  end

  describe '#return' do
    let(:user_book) { create(:user_book) }
    context '正常終了の場合' do
      it do
        user_book.return
        expect(user_book.return_date).not_to be_nil
      end
    end
  end
end
