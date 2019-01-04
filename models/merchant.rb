require_relative('../db/sql_runner')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def transaction_count()
    transactions = Transaction.all_by_merchant(@name)
    transactions.count
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Merchant.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Merchant.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    return results.map{|hash| Merchant.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

end
