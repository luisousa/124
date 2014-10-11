class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  helper_method :say_hello


  before_filter :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy,:show]
  before_filter :check_user, only: [:edit, :update, :destroy,:show]



  # GET /searches
  # GET /searches.json
  def index
    #@searches = Search.all
    @searches = Search.where(user: current_user)
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render action: 'show', status: :created, location: @search }


      else
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end


def say_hello(url)
 require 'nokogiri'
 require 'open-uri'

  #   @courses='ABCD'+s1


    @list_result = []
    #for i in 1..2
      #url = "http://www.olx.pt/nf/search/fiat+124/-p-#{i}"
      
   #   url = "http://www.olx.pt/nf/carros-cat-378/fiat+124"
      #url = "http://www.olx.pt/nf/carros-cat-378/BMW+318i"
      #url = "http://www.olx.pt/nf/carros-cat-378"
      

    if url.include? "olx.pt/"
         
    #PARA OLX ACRECENTAR nf
      doc = Nokogiri::HTML(open(url))

      title = doc.at_css('div#listingTitle').text


      @doc1  = doc
      doc.css(".results").each do |item|


    
        #REVER
        #tech_ids = params[:technols][:id].reject(&:blank?) unless params[:technols].nil?

        #TODO
        #CRIAR IMAGEM A DIZER SEM FOTO!!!!

        if(item.at_css(".pic img").nil?)
          imagem = "https://db.tt/6mP7KWfn"
        else
          imagem = item.at_css(".pic img")[:src] 
        end

      

      params[:anuncio] = {:titulo => item.at_css(".ti a")[:title][0..40],:descricao => item.at_css(".ti a")[:href],:image => imagem,:preco => item.at_css(".price").text,:data => item.at_css(".date").text,:link => title,:site_img => "https://db.tt/euZ3OV6H"} 

      @anuncio1=Anuncio.new(params[:anuncio])

      @list_result << @anuncio1

    end
  end



  #CODE CUSTO JUSTO


    if url.include? "custojusto.pt/"
 
      #url = "http://www.custojusto.pt/portugal/carros-usados/q/fiat+124"

    
      doc = Nokogiri::HTML(open(url))
    
      
      title = doc.at_css('div#content_header h1').text
      
      if(title.nil?)
         title = "Lista anuncios"
       end

      doc.css(".lista").each do |item|

      if(item.at_css(".li_image img").nil?)
                imagem = "https://db.tt/6mP7KWfn"
        else
                imagem = item.at_css(".li_image_bg img")[:src] 
      end


      params[:anuncio] = {:titulo => item.at_css(".li_desc a").text[0..40],:descricao => item.at_css(".li_desc a")[:href],:preco => item.at_css(".li_price").text,:data => item.at_css(".li_date").next_element.text,:image =>  imagem,:link => title,:link => title,:site_img => "https://db.tt/XaOVYCX9"} 

      @anuncio2=Anuncio.new(params[:anuncio])

    #   @list_result_cj << item.at_css(".li_desc a").text+item.at_css(".li_price").text
      @list_result << @anuncio2 



      end

    end


    if   @list_result.blank? == true
      params[:anuncio] = {:titulo => "Sem titulo",:descricao => "Sem Desc",:preco => "Sem preco",:data => "Sem data",:image => "https://db.tt/6mP7KWfn" } 

      @anuncio3=Anuncio.new(params[:anuncio])

      @list_result << @anuncio3

      @list_result
      
      
    else
       @list_result
       
    end
    
end 


def check_user
      if current_user != @search.user
        redirect_to root_url, alert: "Sorry, this search belongs to someone else"
      end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:site, :title, :description, :url)
    end
end
