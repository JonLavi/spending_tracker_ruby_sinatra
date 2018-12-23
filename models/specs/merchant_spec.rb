require('minitest/autorun')
require('minitest/rg')
require_relative('../merchant')

class MerchantTest < MiniTest::Test

  def test_merchant_name
    merchant = Merchant.new({'name' => 'Tesco'})
    assert_equal('Tesco', merchant.name)
  end

end
