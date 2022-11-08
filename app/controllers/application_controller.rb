require './config/environment'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

    #creates all the users
    post "/user" do 
      user= User.create(name:params[:name])
      user.to_json
    end
    #gets all the users
    get "/user" do
      user = User.all
      user.to_json
    end

    #Display all the Post
    get "/" do
      post = Post.all
      post.to_json
    end

    #find post by id
    get "/post/:id" do
      post = Post.find(params[:id])
      post.to_json
    end

    #posting a new Article
    post "/post" do 
      post = Post.create(title:params[:title], content:params[:content],category:params[:category])
      post.to_json
    end

      #comment section
    post "/comments" do 
      comment = Comment.create(comment:params[:comment])
      comment.to_json
    end

    #deleting a post
    delete "/post/:id" do
      post = Post.find_by(params[:id])
      post.destroy
      post.to_json
    end
 
end