require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/budget')
require('pry')

Transaction.delete_all
Tag.delete_all
Merchant.delete_all
Budget.delete_all

tag1 = Tag.new({'name' => 'groceries'})
tag1.save()
tag2 = Tag.new({'name' => 'entertainment'})
tag2.save()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save()
merchant2 = Merchant.new({'name' => 'Amazon'})
merchant2.save()

budget1 = Budget.new({'name'=>'Food', 'amount'=>'200'})
budget1.save()
budget2 = Budget.new({'name'=>'Fun', 'amount'=>'300'})
budget2.save()

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => '50', 'trans_date' => '2006-12-12', 'budget_id' => budget1.id})
transaction1.save()
transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'amount' => '25', 'trans_date' => '2019-01-01', 'budget_id' => budget2.id})
transaction2.save()



#TESTED METHODS
#  .save()
#  .update()
#  .delete()
#  Merchant.find(id)
#  Merchant.delete_by_id(id)
#  Merchant.all()
#  Merchant.delete_all()
#  Transaction.total
#  transaction1.merchant()
#  transaction1.tag()


#TODO : test crud for tags/transactions

binding.pry
nil
