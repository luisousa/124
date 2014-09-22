class PagesController < ApplicationController
  def result
	 	require 'nokogiri'
		require 'open-uri'

		@list_result = []
		#for i in 1..2
			#url = "http://www.olx.pt/nf/search/fiat+124/-p-#{i}"
			
			url = "http://www.olx.pt/nf/carros-cat-378/fiat+124"
			#url = "http://www.olx.pt/nf/carros-cat-378/BMW+318i"
			#url = "http://www.olx.pt/nf/carros-cat-378"
			
			#PARA OLX ACRECENTAR nf


			doc = Nokogiri::HTML(open(url))
			@doc1  = doc
			doc.css(".results").each do |item|

		
				#REVER
				#tech_ids = params[:technols][:id].reject(&:blank?) unless params[:technols].nil?

				#TODO
				#CRIAR IMAGEM A DIZER SEM FOTO!!!!

				if(item.at_css(".pic img").nil?)
					imagem = "https://db.tt/6mP7KWfn";
				else
					imagem = item.at_css(".pic img")[:src] 
				end

			

			params[:anuncio] = {:titulo => item.at_css(".ti a")[:title],:descricao => item.at_css(".ti a")[:href],:image => imagem,:preco => item.at_css(".price").text,:data => item.at_css(".date").text} 

			@anuncio1=Anuncio.new(params[:anuncio])
			
			
	#		@list_result << item.at_css(".ti").text+item.at_css(".ti a")[:href]+" - "+item.at_css(".pic img")[:src]

		  @list_result << @anuncio1
			end
	#	end

		@list_result_cj = []
			url = "http://www.custojusto.pt/portugal/carros-usados/q/fiat+124"
		
		if url.include? "custojusto.pt/"
			doc = Nokogiri::HTML(open(url))
			doc.css(".lista").each do |item|
	

			params[:anuncio] = {:titulo => item.at_css(".li_desc a").text,:descricao => item.at_css(".li_desc a")[:href],:preco => item.at_css(".li_price").text,:data => item.at_css(".li_date").next_element.text,:image => item.at_css(".li_image img")[:src] } 



			@anuncio2=Anuncio.new(params[:anuncio])

		#  	@list_result_cj << item.at_css(".li_desc a").text+item.at_css(".li_price").text
			@list_result_cj << @anuncio2 

			end
		end

		@list_result_cars_olx = []
	#	#for i in 1..2
	#		#url = "http://www.olx.pt/nf/search/fiat+124/-p-#{i}"
			url = "http://www.olx.pt/nf/carros-cat-378/price_to,2500,year_to,1992"
	#		doc = Nokogiri::HTML(open(url))
	#		doc.css(".results").each do |item|
	#	  	@list_result_cars_olx << item.at_css(".ti").text+item.at_css(".date").text
	#		end

	
			#url = "http://www.olx.pt/nf/carros-cat-378/BMW+318i"
			#url = "http://www.olx.pt/nf/carros-cat-378"
			
			#PARA OLX ACRECENTAR nf


			doc = Nokogiri::HTML(open(url))
			@doc1  = doc
			doc.css(".results").each do |item|

		
				#REVER
				#tech_ids = params[:technols][:id].reject(&:blank?) unless params[:technols].nil?

				#TODO
				#CRIAR IMAGEM A DIZER SEM FOTO!!!!

				if(item.at_css(".pic img").nil?)
					imagem = "https://db.tt/6mP7KWfn";
				else
					imagem = item.at_css(".pic img")[:src] 
				end

			

			params[:anuncio] = {:titulo => item.at_css(".ti a")[:title],:descricao => item.at_css(".ti a")[:href],:image => imagem,:preco => item.at_css(".price").text,:data => item.at_css(".date").text} 

			@anuncio3=Anuncio.new(params[:anuncio])

			@list_result_cars_olx  << @anuncio3
			end
  end
end
