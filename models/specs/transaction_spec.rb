require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')

class TransactionTest < MiniTest::Test

  def test_transaction_merchant_id
    transaction = Transaction.new({'merchant_id' => '1', 'tag_id' => '1'})
    assert_equal(1, transaction.merchant_id)
  end

  def test_transaction_tag_id
    transaction = Transaction.new({'merchant_id' => '1', 'tag_id' => '1'})
    assert_equal(1, transaction.tag_id)
  end

end
