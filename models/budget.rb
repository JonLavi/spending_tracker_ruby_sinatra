require_relative('../db/sql_runner')

class Budget

  attr_reader :id
  attr_accessor :amount

  def initialize(options)
    @id = 1
    @amount = options['amount'].to_i
  end

  def remaining_funds
    remaining_funds = @amount - Transaction.total
  end

  def status?
    sum = Transaction.total
    if sum > @amount
      return "you are over balance!"
    elsif sum > (@amount*0.8)
      return "you are close to your limit"
    else
      return "you still have money left"
    end
  end

  #### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO budgets (amount, id) VALUES ($1, $2)"
    values = [@amount, @id]
    results = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE budgets SET amount = $1 WHERE id = $2"
    values = [@amount, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Budget.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Budget.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    results = SqlRunner.run(sql)
    return results.map{|hash| Budget.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

end
