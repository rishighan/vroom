class PostsController < ApplicationController
 layout "admin"
    def new
        @post = Post.new
    end

    def index
        @posts = Post.all

    end

    def create
        @post = Post.new(post_params) #init model with attributes

        if @post.save #save model to db by mapping fields to columns
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :excerpt, :citations)
    end

end
