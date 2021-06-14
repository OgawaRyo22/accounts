require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection("sqlite3:accounts.sqlite3")

class Accout < ActiveRecord::Base
  
end

database.execute("INSERT INTO shop(moved_money, title) VALUES('ENV["movm"], ENV["tit"])")

=begin

post '/post/:id/delete' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/post'
end

post '/post/:id' do
  post = Post.find(params[:id])
  post.title = params[:title]
  post.content = params[:content]
  post.save
  redirect '/post'
end

=end



