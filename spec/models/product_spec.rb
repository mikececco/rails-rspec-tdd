require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @invalid_product = Product.new(title: '', description: '', price: '')
    @valid_product = Product.new(title: 'One', description: 'description one', price: '100.00')
    @invalid_price = Product.new(title: 'One', description: 'description one', price: '0.00')
  end

  describe 'title' do
    it 'validates presence of title' do
      product = @invalid_product
      product.valid?
      expect(product.errors[:title]).to include("can't be blank")
    end

    it 'validates uniqueness of a title' do
      @valid_product.save
      new_product = @valid_product.dup
      new_product.valid?
      expect(new_product.errors[:title]).to include('has already been taken')
    end
  end
end
