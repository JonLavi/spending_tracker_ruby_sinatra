require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')

tag1 = Tag.new({'name' => 'groceries'})
tag2 = Tag.new({'name' => 'entertainment'})

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'Amazon'})

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id})
transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'tag_id' => tag2.id})
