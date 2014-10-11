class Anuncio
 include ActiveModel::Serialization
 attr_accessor :titulo, :descricao, :data, :preco, :image,:link,:site_img
 
 def initialize(attributes = {})
  @titulo=attributes[:titulo]
  @descricao=attributes[:descricao]
  @image=attributes[:image]
  @data=attributes[:data]
  @preco=attributes[:preco]
  @link=attributes[:link]
  @site_img=attributes[:site_img]
 end
  
# persisted is important not to get "undefined method `to_key' for" error
 def persisted?
  false
 end
  
end