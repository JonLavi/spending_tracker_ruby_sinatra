class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :amount, :trans_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_i
    @trans_date = options['trans_date']
    @budget_id = 1
  end

  def merchant()
    sql = 'SELECT name FROM merchants where id = $1'
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)[0]['name']
    return results
  end

  def tag()
    sql = 'SELECT name FROM tags where id = $1'
    values = [@tag_id]
    results = SqlRunner.run(sql, values)[0]['name']
    return results
  end

  def self.all_by_merchant(merchant_id)
    sql = 'SELECT transactions.* FROM transactions
          INNER JOIN merchants ON transactions.merchant_id = merchants.id
          WHERE merchants.id = $1'
    values = [merchant_id]
    results = SqlRunner.run(sql, values)
    results.map{|transaction| Transaction.new(transaction)}
  end

  def self.all_by_tag(tag_id)
    sql = 'SELECT transactions.* FROM transactions
          INNER JOIN tags ON transactions.tag_id = tags.id
          WHERE tags.id = $1'
    values = [tag_id]
    results = SqlRunner.run(sql, values)
    results.map{|transaction| Transaction.new(transaction)}
  end

  def self.sum(transactions)
    sum = 0
    for transaction in transactions
      sum += transaction.amount.to_i
    end
    return sum
  end

  def self.sum_by_tag(tag_id)
    transactions = Transaction.all_by_tag(tag_id)
    Transaction.sum(transactions)
  end

  def self.sum_by_merchant(merchant_id)
    transactions = Transaction.all_by_merchant(merchant_id)
    Transaction.sum(transaction)
  end

  def self.total
    sql = 'SELECT SUM(amount) from transactions'
    results = SqlRunner.run(sql)[0]['sum'].to_i
    return results
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, amount, trans_date, budget_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@merchant_id, @tag_id, @amount, @trans_date, @budget_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, tag_id, amount, trans_date, budget_id) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@merchant_id, @tag_id, @amount, @trans_date, @budget_id, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Transaction.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Transaction.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map{|hash| Transaction.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

end
