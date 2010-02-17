=begin rdoc

= WebGet Ruby Gem: PersonName

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Return the person's name in various ways.

==Example
  class User < ActiveRecord::Base
    include PersonName
  end

  u=User.new  
  u.first_name = 'Zora'
  u.middle_name = 'Neale'
  u.last_name = 'Hurston'

  u.full_name => "Zora Neale Hurston"
  u.list_name => "Hurston, Zora Neale"

==Suggestion

To make these very fast in Rails, try using the memoize approach:
  class User < ActiveRecord::Base
    include PersonName
    memoize :full_name
    memoize :list_name
  end

==Notes

The first_name, middle_name, and last_name fields must be strings.

=end


module PersonName


  # Return true iff the person has a first name and its non-blank

  def first_name?
   respond_to?(:first_name) and first_name and first_name!='' and first_name.strip!=''
  end


  # Return true iff the person has a middle name and its non-blank

  def middle_name?
   respond_to?(:middle_name) and middle_name and middle_name!='' and middle_name.strip!=''
  end


  # Return true iff the person has a last name and its non-blank

  def last_name?
   respond_to?(:last_name) and last_name and last_name!='' and last_name.strip!=''
  end


  # Return the person's first name + middle initial + last name
  #
  # ==Example
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
  # ==Example
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
  # ==Example
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
