class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
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
