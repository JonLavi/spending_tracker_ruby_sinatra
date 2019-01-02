class Budget

  attr_accessor :amount  

  def initialize(options)
    @amount = options["amount"].to_i
  end

end
