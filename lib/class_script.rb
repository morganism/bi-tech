#!/usr/bin/env ruby

# morgan.sziraki@gmail.com
# Tue 20 Sep 2022 10:31:07 BST

require 'optparse'
require 'ostruct'

EXIT_INVALID_OPTIONS = 1

class ClassScript

  attr_accessor :number

  def initialize(options)
    @number = options.number
  end

  def segment(input, dictionary)
    sorted_dictionary = dictionary.sort_by(&:length).reverse
    sorted_dictionary.each do |word|
      input.gsub!(word,"")
    end
    return input == ''
    false
  end

  def multiply_by(multiplier)
    @number * multiplier
  end

  def print
    puts "Number is #{@number}"
  end
end

def validate_options(options)
  errors = Array.new
  unless (options.number || (options.x.is_a? Integer))
    errors << 'You must specify an integer: -n INT'
  end

  if errors.count > 0
    puts errors.join("\n")
    exit EXIT_INVALID_OPTIONS
  end
end

# if running as a script
if __FILE__ == $0
  options = OpenStruct.new

  OptionParser.new do |opts|
    opts.banner = "Usage: SCRIPT_NMAE [options]\n  *** Only GET method supported. ***"
    opts.on('-n', '--number INT', 'an int') { |o| options.number = o }
    opts.on_tail('-h', '--help') {
      puts opts
      exit
    }
  end.parse!

  validate_options(options)

  obj = ClassScript.new(options)
  obj.print
end
