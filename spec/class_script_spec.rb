require 'rspec/autorun'
require 'optparse'
require 'ostruct'

 describe ClassScript do
   it "prints the -n number option" do
     options = OpenStruct.new
     options.number = 2
     cs = ClassScript.new(options)
     expect(cs.number).to eq(2)
   end
 end