require 'rails_helper'

RSpec.describe FibSeq, type: :model do
  context "validations" do
  	it { should validate_presence_of(:value)}
  	it { should validate_presence_of(:result)}
  	it { should validate_presence_of(:runtime)}
  end
end
