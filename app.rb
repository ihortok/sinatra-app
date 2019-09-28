require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'haml'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/' do
  @books = Book.all
  haml :index
end

get '/books/new' do
  haml :new
end

post '/books' do
  book = Book.new(params[:book])
  book.save
  redirect '/books'
end
