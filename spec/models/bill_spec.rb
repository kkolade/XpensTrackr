# spec/models/bill_spec.rb
require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:valid_attributes) do
    {
      name: 'Example Bill',
      icon: 'icon.png',
      author: user
    }
  end

  it 'is valid with valid attributes' do
    bill = Bill.new(valid_attributes)
    expect(bill).to be_valid
  end

  it 'is not valid without a name' do
    bill = Bill.new(valid_attributes.merge(name: nil))
    expect(bill).to_not be_valid
  end

  it 'is not valid without an icon' do
    bill = Bill.new(valid_attributes.merge(icon: nil))
    expect(bill).to_not be_valid
  end

  it 'belongs to an author (User)' do
    expect(Bill.reflect_on_association(:author).macro).to eq(:belongs_to)
  end

  it 'has and belongs to many items' do
    expect(Bill.reflect_on_association(:items).macro).to eq(:has_and_belongs_to_many)
  end
end
