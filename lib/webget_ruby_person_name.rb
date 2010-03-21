=begin rdoc

= WebGet Ruby Gem: PersonName

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Access a human name from the fields of an ActiveRecord-based model in several combinations:
* first_name_middle_name
* first_name_middle_initial
* fullname: first_name_middle_name_last_name
* first_name_middle_initial_last_name
* first_name_last_name
* list_name: last_name, first_name

*Note* that the model doesn't need attributes called first_name, middle_name, and last_name to call the gem's methods; the methods are protected by testing with respond_to?(name_field).

However all of these fields which are present must be strings.

==Example
  class User < ActiveRecord::Base
    include PersonName
  end
  
  u=User.first
  => {first_name => 'Zora', middle_name => 'Neale', last_name => 'Hurston'}
  
  u.full_name => "Zora Neale Hurston"
  u.list_name => "Hurston, Zora Neale"
  u.first_name_middle_name => "Zora Neale"
  u.first_name_middle_initial_last_name => "Zora N Hurston"

==Performance Tip

Use memoize to make these very fast in Rails:

  class User < ActiveRecord::Base
    include PersonName
    memoize :full_name
    memoize :list_name
  end


=end


module PersonName


  # Return true if the person has a first name and its non-blank, false otherwise
  # 
  # @return [Boolean] person has a first name and its non-blank

  def first_name?
   respond_to?(:first_name) and first_name and first_name!='' and first_name.strip!=''
  end


  # Return true if the person has a middle name and its non-blank, false otherwise
  # 
  # @return [Boolean] person has a middle name and its non-blank

  def middle_name?
   respond_to?(:middle_name) and middle_name and middle_name!='' and middle_name.strip!=''
  end


  # Return true if the person has a last name and its non-blank, false otherwise
  # 
  # @return [Boolean] person has a last name and its non-blank

  def last_name?
   respond_to?(:last_name) and last_name and last_name!='' and last_name.strip!=''
  end

  
  # Return the person's first name + middle name
  #
  # @return [String] person's first name + middle name
  # 
  # @example
  #   u.first_name_middle_name => "Zora Neale"

  def first_name_middle_name
    pieces = []
    (pieces << first_name)    if first_name?
    (pieces << middle_name)   if middle_name?
    return pieces.join(' ')
  end
  

  # Return the person's first name + middle initial 
  #
  # @return [String] person's first name + middle initial
  # 
  # @example
  #   u.first_name_middle_initial => "Zora N"

  def first_name_middle_initial
    pieces = []
    (pieces << first_name)           if first_name?
    (pieces << middle_name[0...1])   if middle_name?
    return pieces.join(' ')
  end


  # Return the person's first name + middle initial + last name
  #
  # @return [String] person's first name + middle initial + last name
  # 
  # @example
  #   u.first_name_middle_initial_last_name => "Zora N Hurston"

  def first_name_middle_initial_last_name
   pieces = []
    (pieces << first_name)           if first_name?
    (pieces << middle_name[0...1])   if middle_name?
    (pieces << last_name)            if last_name?
    return pieces.join(' ')
  end


  # Return the person's full name: first_name middle_name last_name
  #
  # @return [String] person's first name + middle name +last_name
  # 
  # @example
  #   u.full_name => "Zora Neale Hurston"
  #
  # This method skips any piece of the name that is missing or blank.

  def full_name
    pieces = []
    (pieces << first_name)     if first_name?
    (pieces << middle_name)    if middle_name?
    (pieces << last_name)      if last_name?
    return pieces.join(' ')
  end


  # Return the person's list name: last_name, first_name middle_name
  #
  # @return [String] person's last name + ', ' + first name
  # 
  # @example
  #   u.list_name => "Hurston, Zora Neale"
  #
  # This method skips any piece of the name that is missing or blank.

  def list_name
    pieces = []
    (pieces << first_name)  if first_name?
    (pieces << middle_name) if middle_name?
    if last_name?
      comma = pieces.size>0 ? ',' : ''
      pieces.unshift(last_name+comma)
    end
    return pieces.join(' ')
  end

end
