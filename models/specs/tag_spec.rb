require('minitest/autorun')
require('minitest/rg')
require_relative('../tag')

class TagTest < MiniTest::Test

  def test_tag_name
    tag = Tag.new({'name' => 'groceries'})
    assert_equal('groceries', tag.name)
  end

end
