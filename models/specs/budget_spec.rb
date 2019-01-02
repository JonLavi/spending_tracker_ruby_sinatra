require('minitest/autorun')
require('minitest/rg')
require_relative('../budget')

class BudgetTest < MiniTest::Test

  def test_budget_amount
    budget = Budget.new({'amount' => '200', 'name'=>'Groceries'})
    assert_equal(200, budget.amount)
  end

  def test_budget_name
    budget = Budget.new({'amount' => '200', 'name'=>'Groceries'})
    assert_equal('Groceries', budget.name)
  end

end
