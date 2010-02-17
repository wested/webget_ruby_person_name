require 'test/unit'
require 'webget_ruby_person_name'

class PersonNameTest < Test::Unit::TestCase

 def test_first_name_middle_initial_last_name_with_first_name
  assert_equal("abc",p("abc",nil,nil).first_name_middle_initial_last_name)
 end

 def test_first_name_middle_initial_last_name_with_middle_name
  assert_equal("d", p(nil,"def",nil).first_name_middle_initial_last_name)
 end

 def test_first_name_middle_initial_last_name_with_last_name
  assert_equal("ghi",p(nil,nil,"ghi").first_name_middle_initial_last_name)
 end

 def test_first_name_middle_initial_last_name_with_first_name_and_middle_name
  assert_equal("abc d",p("abc","def",nil).first_name_middle_initial_last_name)
 end

 def test_first_name_middle_initial_last_name_with_first_name_and_last_name
  assert_equal("abc ghi",p("abc",nil,"ghi").first_name_middle_initial_last_name)
 end

 def test_first_name_middle_initial_last_name
  p=Person.new("abc","def","ghi")
  assert_equal("abc d ghi",p.first_name_middle_initial_last_name)
 end

 def test_full_name_with_first_name
  assert_equal("abc",p("abc",nil,nil).full_name)
 end

 def test_full_name_with_middle_name
  assert_equal("def",p(nil,"def",nil).full_name)
 end

 def test_full_name_with_last_name
  assert_equal("ghi",p(nil,nil,"ghi").full_name)
 end

 def test_full_name_with_first_name_and_middle_name
  assert_equal("abc def",p("abc","def",nil).full_name)
 end

 def test_full_name_with_first_name_and_last_name
  assert_equal("abc ghi",p("abc",nil,"ghi").full_name)
 end

 def test_full_name_with_middle_name_and_last_name
  assert_equal("def ghi",p(nil,"def","ghi").full_name)
 end

 def test_full_name
  assert_equal("abc def ghi",p("abc","def","ghi").full_name)
 end

 def test_list_name_with_first_name
  assert_equal("abc",p("abc",nil,nil).list_name)
 end

 def test_list_name_with_middle_name
  assert_equal("def", p(nil,"def",nil).list_name)
 end

 def test_list_name_with_last_name
  assert_equal("ghi",p(nil,nil,"ghi").list_name)
 end

 def test_list_name_with_first_name_and_middle_name
  assert_equal("abc def",p("abc","def",nil).list_name)
 end

 def test_list_name_with_first_name_and_last_name
  assert_equal("ghi, abc",p("abc",nil,"ghi").list_name)
 end

 def test_list_name_with_middle_name_and_last_name
  assert_equal("ghi, def",p(nil,"def","ghi").list_name)
 end

 def test_list_name
  assert_equal("ghi, abc def",p("abc","def","ghi").list_name)
 end

 # Factory
 def p(first,middle,last)
  Person.new(first,middle,last)
 end

end


class Person

 attr_accessor :first_name
 attr_accessor :middle_name
 attr_accessor :last_name

 include PersonName

 def initialize(first,middle,last)
  @first_name=first
  @middle_name=middle
  @last_name=last
 end

end
