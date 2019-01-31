class FibSeqController < ApplicationController
	
require 'benchmark'

	def get_fib_value(series_num)
			total = 1
			first = 1
			second = 1
			time = Benchmark.measure {
				series_num.times do
					total = first + second
					first = second
					second = total
				end
			}
			fib_data = {}
			fib_data[:series_number] = series_num
			fib_data[:fib_result] = total
			fib_data[:process_time_in_sec] = time.real.to_s 
			return fib_data
	end

	def index
    	fibseq = get_fib_value(25)
        render json: {status: 'SUCCESS', message: 'Loaded all posts', data: fibseq}, status: :ok
    end 


end
