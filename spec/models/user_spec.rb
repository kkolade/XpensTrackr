require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) do
    {
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  it 'is valid with valid attributes' do
    user = User.new(valid_attributes)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(valid_attributes.merge(name: nil))
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(valid_attributes.merge(email: nil))
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(valid_attributes.merge(password: nil))
    expect(user).to_not be_valid
  end

  it 'is not valid with a password confirmation that does not match the password' do
    user = User.new(valid_attributes.merge(password_confirmation: 'mismatched_password'))
    expect(user).to_not be_valid
  end

  it 'has many bills' do
    expect(User.reflect_on_association(:bills).macro).to eq(:has_many)
  end

  it 'has many items' do
    expect(User.reflect_on_association(:items).macro).to eq(:has_many)
  end

  it 'uses the database_authenticatable Devise module' do
    expect(User.devise_modules).to include(:database_authenticatable)
  end

  it 'uses the registerable Devise module' do
    expect(User.devise_modules).to include(:registerable)
  end

  it 'uses the recoverable Devise module' do
    expect(User.devise_modules).to include(:recoverable)
  end

  it 'uses the rememberable Devise module' do
    expect(User.devise_modules).to include(:rememberable)
  end

  it 'uses the validatable Devise module' do
    expect(User.devise_modules).to include(:validatable)
  end
end
