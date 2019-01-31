class FibSeqController < ApplicationController
	
require 'benchmark'
require 'httparty'
require 'json'

def get_fib_value(series_num)
		series_num = series_num.to_i
		total = 1
		first = 1
		second = 1
		if series_num == 0
			fib_data = {}
			fib_data[:val] = 0
			fib_data[:res] = 0
			fib_data[:run] = 'NA'
			return fib_data
		elsif series_num == 1
			fib_data = {}
			fib_data[:val] = 1
			fib_data[:res] = 1
			fib_data[:run] = 'NA'
			return fib_data	
		else
			time = Benchmark.measure {
				(series_num-1).times do
					total = first + second
					first = second
					second = total
				end
			}
			fib_data = {}
			fib_data[:val] = series_num
			fib_data[:res] = total
			fib_data[:run] = time.real.to_s 
			return fib_data
		end

end

	def index
    	@fibseq = FibSeq.limit(10).order("ID DESC").all
    end

    def create
    	@seqnum = params[:seqnum]
    	@sequence = get_fib_value(@seqnum) 
    	newseq = FibSeq.create!(value: get_fib_value(@seqnum)[:val], result: get_fib_value(@seqnum)[:res], runtime: get_fib_value(@seqnum)[:run])
    	if newseq.save
    		render :json => @sequence
    	else
    		render json: {}, status: 400
    	end  
    end

end
