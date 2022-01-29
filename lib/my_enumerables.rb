# frozen_string_literal: true

require 'pry-byebug'

# Description/Enumerable module for creating enumerable methods from scratch
module Enumerable
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = []
    my_each do |element|
      result.push(element) if yield(element)
    end
    result
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    result = []
    my_each do |element|
      result.push(yield(element))
    end
    result
  end

  def my_inject(initial_value)
    sum = initial_value
    my_each do |element|
      sum = yield(sum, element)
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    # we are not supposed to use 'each' for this assignment
    # so I disabled the rubocop warning around this statement
    # rubocop:disable Style/For
    for element in self
      yield(element)
    end
    # rubocop:enable Style/For
  end
end
