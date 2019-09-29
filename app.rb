require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'haml'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }
set :public_folder, 'public'

get '/books' do
  @books = Book.all
  haml :'books/index'
end

get '/books/new' do
  haml :'books/new'
end

post '/books' do
  book = Book.new(params[:book])
  book.save
  redirect '/books'
end
