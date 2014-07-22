class PostsController < ApplicationController
 layout "admin"


    def new
        @post = Post.new
        @categories = @post.categories.build
        @post.attachments.build

    end

    def index
        @posts = Post.all
    end

    def create
        @post = Post.new(post_params) #init model with attributes
        @post.attachments.build(params[:attachments])
        respond_to do |format|
        if @post.save #save model to db by mapping fields to columns
                format.html {redirect_to @post, notice: "Uploaded successfully"}
        else
                format.html {render action:"new"}

        end
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
        #@post.attachments.pictures = nil
        @post.destroy

        redirect_to posts_path
    end

    def load_imageable
        resource, id = request.path.split('/')[1, 2]
        @imageable  = resource.singularize.classify.constantize.find(id)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :excerpt, :citations, {:category_ids => []}, attachments_attributes: [:picture, :name])
    end


 end
