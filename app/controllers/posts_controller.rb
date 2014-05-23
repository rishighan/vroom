class PostsController < ApplicationController

    def new

    end

    def index
        @post = Post.all
    end

    def create
        @post = Post.new(post_params) #init model with attributes
        @post.save #save model to db by mapping fields to columns
        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :excerpt, :citations)
    end





end
