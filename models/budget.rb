require_relative('../db/sql_runner')

class Budget

  attr_reader :id
  attr_accessor :amount, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @amount = options['amount'].to_i
  end

  def transactions()
    Transaction.all_by_budget(@id)
  end

  #def remaining_funds

  def status?
    sum = Transaction.sum_by_budget(@id)
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
      sql = "INSERT INTO budgets (name, amount) VALUES ($1, $2) RETURNING id"
      values = [@name, @amount]
      results = SqlRunner.run(sql, values)
      @id = results[0]['id'].to_i
    end

    def update()
      sql = "UPDATE budgets SET (name, amount) = ($1, $2) WHERE id = $3"
      values = [@name, @amount, @id]
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
