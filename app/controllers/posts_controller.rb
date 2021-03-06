class PostsController < ApplicationController
    require 'carrierwave/orm/activerecord'
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path(@post)
        end
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:picture,:picture_cache)
    end
end
