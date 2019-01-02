require('minitest/autorun')
require('minitest/rg')
require_relative('../budget')

class BudgetTest < MiniTest::Test

  def test_budget_amount
    budget = Budget.new({'amount' => '200'})
    assert_equal(200, budget.amount)
  end

end
