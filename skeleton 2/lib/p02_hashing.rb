require 'byebug'
require 'json'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    value = ''
    self.each_with_index do |x, i|
      value += (x.hash % self.length + i).to_s
    end
    value.to_i
  end
end

class String
  def hash
    value = ''
    string_array = self.split(//)
    string_array.each do |x|
      value += (x.ord.hash % self.length).to_s
    end
    value.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = self.to_a.sort
    array.hash
  end
end
