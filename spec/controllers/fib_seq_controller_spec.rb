require 'rails_helper'

RSpec.describe FibSeqController, type: :controller do

	describe "#create" do
		@seqnum = 4
	    it "should successfully create a new entry" do
	      expect{
	        post :create
	      }.to change{ FibSeq.count }.by(1)
	    end

	    it "should successfully create non-null entry" do
	      expect{
	        post :create
	        FibSeq.last}.should_not be_nil
	    end

	    it "should redirect the user to the json data" do
	        post :create
	        expect(response).to have_http_status(200)
	    end

	    it "should error out to a 400 error" do
	        @secnum = "hahaha"
	        post :create
	        expect(response).to have_http_status(400)
	    end

	  it 'should solve the Fibonacci Sequence no matter the number' do
	    expect{post :create 
	    Fibseq.last.result}.equal?(5)
	    @secnum = 22
	    expect{post :create 
	    Fibseq.last.result}.equal?(28657)
	    @secnum = 33
	    expect{post :create 
	    Fibseq.last.result}.equal?(702887)
	     @secnum = 0
	    expect{post :create 
	    Fibseq.last.result}.equal?(0)
	     @secnum = 1
	    expect{post :create 
	    Fibseq.last.result}.equal?(1)
	  end
	end

	 it 'should have a time recorded no matter the number' do
	    expect{post :create 
	    Fibseq.last.runtime}.should_not be_nil
	    @secnum = 22
	    expect{post :create 
	    Fibseq.last.runtime}.should_not be_nil
	    @secnum = 33
	    expect{post :create 
	    Fibseq.last.runtime}.should_not be_nil
	     @secnum = 0
	    expect{post :create 
	    Fibseq.last.runtime}.should_not be_nil
	     @secnum = 1
	    expect{post :create 
	    Fibseq.last.runtime}.should_not be_nil
	  end

end


