#require 'rspec/autorun'
require 'optparse'
require 'ostruct'
require 'class_script'

 describe ClassScript do
   it 'prints the -n number option of 2' do
     options = OpenStruct.new
     options.number = 2
     cs = ClassScript.new(options)
     expect(cs.number).to eq(2)
   end

   it 'multiplies the -n number option by 2' do
     options = OpenStruct.new
     options.number = 2
     cs = ClassScript.new(options)
     expect(cs.multiply_by_2).to eq(4)
   end
 end