class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end


#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id) VALUES ($1, $2) RETURNING id"
    values = [@merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, tag_id) = ($1, $2) WHERE id = $4"
    values = [@merchant_id, @tag_id, @id]
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
