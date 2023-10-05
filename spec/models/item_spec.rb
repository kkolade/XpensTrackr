# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:valid_attributes) do
    {
      name: 'Example Item',
      amount: 100,
      author: user
    }
  end

  it 'is valid with valid attributes' do
    item = Item.new(valid_attributes)
    expect(item).to be_valid
  end

  it 'is not valid without a name' do
    item = Item.new(valid_attributes.merge(name: nil))
    expect(item).to_not be_valid
  end

  it 'is not valid without an amount' do
    item = Item.new(valid_attributes.merge(amount: nil))
    expect(item).to_not be_valid
  end

  it 'is not valid with a non-integer amount' do
    item = Item.new(valid_attributes.merge(amount: 10.5))
    expect(item).to_not be_valid
  end

  it 'belongs to an author (User)' do
    expect(Item.reflect_on_association(:author).macro).to eq(:belongs_to)
  end

  it 'has and belongs to many bills' do
    expect(Item.reflect_on_association(:bills).macro).to eq(:has_and_belongs_to_many)
  end
end
