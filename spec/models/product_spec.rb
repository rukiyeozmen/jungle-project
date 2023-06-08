require 'rails_helper'
require 'category'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully when all fields are set' do
      category = Category.create(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price: 9.99,
        quantity: 10,
        category: category
      )
      expect(product.save).to be true
    end

    it 'is not valid without a name' do
      category = Category.create(name: 'Test Category')
      product = Product.new(
        name: nil,
        price: 9.99,
        quantity: 10,
        category: category
      )
      expect(product.valid?).to be false
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      category = Category.create(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price: nil,
        quantity: 10,
        category: category
      )
      expect(product.valid?).to be false
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      category = Category.create(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price: 9.99,
        quantity: nil,
        category: category
      )
      expect(product.valid?).to be false
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(
        name: 'Test Product',
        price: 9.99,
        quantity: 10,
        category: nil
      )
      expect(product.valid?).to be false
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
