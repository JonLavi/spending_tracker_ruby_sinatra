class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

end

#### SQL CRUD Actions ####

  # def save()
  # def update()
  # def delete()
  # def self.find(id)
  # def self.delete_by_id(id)
  # def self.all()
  # def self.delete_all()
