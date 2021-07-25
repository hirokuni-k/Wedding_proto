require 'rails_helper'

RSpec.describe Planner, type: :model do
  describe '新規登録' do
    let(:planner) { FactoryBot.build(:planner) }
    context 'すべての値が正しく入力されている場合' do
      it 'trueが返ること' do
        expect(planner).to be_valid
      end
    end

    context 'email' do
      let(:another_planner) { FactoryBot.build(:planner) }
      it '空の場合falseが返ること' do
        planner.email = nil
        expect(planner.valid?).to be_falsey
      end

      it '@が含まれない場合falseが返ること' do
        planner.email = 'testexample.com'
        expect(planner.valid?).to be_falsey
      end

      it '一意でない場合falseが返ること' do
        another_planner.save
        expect(planner.valid?).to be_falsey
      end
    end

    context 'password' do
      it '英数両方含まない場合falseが返ること' do
        planner.password = 'abcdef'
        expect(planner.valid?).to be_falsey
      end

      it '半角英数字でない場合falseが返ること' do
        planner.password = 'ｓｓｓ１１１'
        expect(planner.valid?).to be_falsey
      end

      it '6文字以上でない場合falseが返ること' do
        planner.password = 'abc12'
        expect(planner.valid?).to be_falsey
      end

      it 'passwordとpassword_comfirmationが一致しない場合falseが返ること' do
        planner.password_confirmation = '1234abcd'
        expect(planner.valid?).to be_falsey
      end
    end

    context 'nickname' do
      it '空の場合falseが返ること' do
        planner.nickname = nil
        expect(planner.valid?).to be_falsey
      end
    end
  end
end
