require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(full_name:"Example User", user_name:"Example User")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  # @userが呼び出せるかのテスト。setupに@userを指定したので、trueとなり呼び出しが成功した。

  test "full_name should be present" do
    @user.full_name = " "
    assert_not @user.valid?
  end
  # full_namebのフォームに空白や未入力の場合@userの呼び出しは行えるか？
  
    test "user_name should be present" do
    @user.user_name = " "
    assert_not @user.valid?
  end
  # 同上
  
  test "full_name should not be too long" do
    @user.full_name = "a" * 51
    assert_not @user.valid?
  end
  # full_nameが５１文字以上だった場合、@userの呼び出しはされない？
  test "user_name should not be too long" do
    @user.user_name = "a" * 51 
    assert_not @user.valid?
  end
  # user_nameが244文字＋@example.comだと@userは呼び出しされない？
  # このままmodelのテストをするとREDになる。user.rbにlengthのバリデーションの指定をするとrails testでテストが通る。
  
#   test "email validation should accept valid addresses" do
#     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
#                         first.last@foo.jp alice+bob@baz.cn]
#     # %w[ ]で文字列の配列を簡単に作れる。メアドのバリデーションは扱いが難しくエラーが発生しやすい。
    
#     valid_addresses.each do |valid_address|
#       @user.email = valid_address
#       assert @user.valid?,"#{valid_address.inspect} should be valid"
#   # どのアドレスでエラーが起こったか特定するために記入する。
#   # inspectメソッドは、前の文字列を表示する。（要求されたオブジェクトを表現する文字列を返す）
#     end
#   end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    # dupは同じ属性をもつデータを複製するためのメソッド
    @user.save
    assert_not duplicate_user.valid?
    # @userと同じメールアドレスのユーザーは作成できないことのテスト
  end
end
