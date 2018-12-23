class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE tags SET name = $1 WHERE id = $2"
    values = [@name, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Tag.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Tag.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM tags WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return results.map{|hash| Tag.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end
