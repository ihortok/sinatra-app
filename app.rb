require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'haml'
require 'faker'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }
set :public_folder, 'public'

get '/books' do
  @books = Book.all
  haml :'books/index'
end

post '/books' do
  book = Book.new(params[:book])
  book.save
  redirect '/books'
end

get '/books/new' do
  haml :'books/new'
end

get '/books/:id/edit' do
  @book = Book.find(params[:id])
  haml :'books/edit'
end

patch '/books/:id' do
  @book = Book.find(params[:id])
  @book.update(params[:book])
  redirect "/books/#{@book.id}"
end

get '/books/:id' do
  @book = Book.find(params[:id])
  haml :'books/show'
end

delete '/books/:id' do
  @book = Book.find(params[:id])
  @book.destroy
  redirect '/books'
end
