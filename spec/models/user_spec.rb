require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    let(:user) { FactoryBot.build(:user) }
    context 'すべての値が正しく入力されている場合' do
      it 'trueが返ること' do
        expect(user).to be_valid
      end
    end

    context 'email' do
      let(:another_user) { FactoryBot.build(:user) }
      it '空の場合falseが返ること' do
        user.email = nil
        expect(user.valid?).to be_falsey
      end

      it '@が含まれない場合falseが返ること' do
        user.email = 'testexample.com'
        expect(user.valid?).to be_falsey
      end

      it '一意でない場合falseが返ること' do
        another_user.save
        expect(user.valid?).to be_falsey
      end
    end

    context 'password' do
      it '英数両方含まない場合falseが返ること' do
        user.password = 'abcdef'
        expect(user.valid?).to be_falsey
      end

      it '半角英数字でない場合falseが返ること' do
        user.password = 'ｓｓｓ１１１'
        expect(user.valid?).to be_falsey
      end

      it '6文字以上でない場合falseが返ること' do
        user.password = 'abc12'
        expect(user.valid?).to be_falsey
      end

      it 'passwordとpassword_comfirmationが一致しない場合falseが返ること' do
        user.password_confirmation = '1234abcd'
        expect(user.valid?).to be_falsey
      end
    end

    context 'nickname' do
      it '空の場合falseが返ること' do
        user.nickname = nil
        expect(user.valid?).to be_falsey
      end
    end

    context 'last_name' do
      it '空の場合falseが返ること' do
        user.last_name = nil
        expect(user.valid?).to be_falsey
      end
    end

    context 'first_name' do
      it '空の場合falseが返ること' do
        user.first_name = nil
        expect(user.valid?).to be_falsey
      end
    end

    context 'last_name_kana' do
      it '空の場合falseが返ること' do
        user.last_name_kana = nil
        expect(user.valid?).to be_falsey
      end
    end

    context 'first_name_kana' do
      it '空の場合falseが返ること' do
        user.first_name_kana = nil
        expect(user.valid?).to be_falsey
      end
    end

    context 'birth_date' do
      it '空の場合falseが返ること' do
        user.birth_date = nil
        expect(user.valid?).to be_falsey
      end
    end

    context 'gender_id' do
      it '空の場合falseが返ること' do
        user.gender_id = nil
        expect(user.valid?).to be_falsey
      end

      it '1の場合はfalseが返ること' do
        user.gender_id = 1
        expect(user.valid?).to be_falsey
      end
    end

    context 'prefecture_id' do
      it '空の場合falseが返ること' do
        user.prefecture_id = nil
        expect(user.valid?).to be_falsey
      end

      it '1の場合はfalseが返ること' do
        user.prefecture_id = 1
        expect(user.valid?).to be_falsey
      end
    end
  end
end