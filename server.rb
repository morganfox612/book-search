require "sinatra"
require "googlebooks"


get "/" do
  erb :home
end
get "/results" do
  @books = GoogleBooks.search("#{params[:search]}")
  @title = GoogleBooks.search("#{params[:search]}").first.title
  @author = GoogleBooks.search("#{params[:search]}").first.authors
  @image = GoogleBooks.search("#{params[:search]}").first.image_link(:zoom => 2, :curl => true)
  @link = GoogleBooks.search("#{params[:search]}").first.info_link
  erb :results
end
