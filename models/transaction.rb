class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

end
