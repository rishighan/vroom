class PostsController < ApplicationController
 layout "admin"
    def new
        @post = Post.new

        4.times {@post.attachments.build}
        @post.categories.build
    end

    def index
        @posts = Post.all
        @attachment = Attachment.all
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

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.picture = nil
        @post.destroy

        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :picture, :excerpt, :citations)
    end

end
