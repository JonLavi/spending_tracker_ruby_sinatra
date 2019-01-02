class Budget

  attr_accessor :amount, :name

  def initialize(options)
    @amount = options['amount'].to_i
    @name = options['name']
  end

end
