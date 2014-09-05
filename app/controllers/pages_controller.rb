class PagesController < ApplicationController
  def result
	 	require 'nokogiri'
		require 'open-uri'

		@list_result = []
		#for i in 1..2
			#url = "http://www.olx.pt/nf/search/fiat+124/-p-#{i}"
			url = "http://www.olx.pt/nf/carros-cat-378/fiat+124"
			doc = Nokogiri::HTML(open(url))
			doc.css(".results").each do |item|
		  	@list_result << item.at_css(".ti").text+item.at_css(".date").text
			end
	#	end

		@list_result_cj = []
			url = "http://www.custojusto.pt/portugal/carros-usados/q/fiat+124"
			doc = Nokogiri::HTML(open(url))
			doc.css(".lista").each do |item|
		  	@list_result_cj << item.at_css(".li_desc a").text+item.at_css(".li_price").text
			end

  end
end
