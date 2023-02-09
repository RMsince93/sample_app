require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
  end

  # Verifica se um utilizador é válido.
  test "should be valid" do
     assert @user.valid?
  end

  # Verifica a presença do atributo "name".
  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  # Verifica a presença do atributo "email".
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  # Verifica se o tamanho do nome é válido.
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # Verifica se o tamanho do email é válido.
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # Aceita emails válidos
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid."
    end
  end

  # Rejeita emails inválidos
  test "email validation reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo_org user.name2example. foo@bar_baz.com foo@bar+bax.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid."
    end
  end

  # Verifica que o email é único
  test "email addressed should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  # Assegura que o email é gravado em letras pequenas
  test "email addressed should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end