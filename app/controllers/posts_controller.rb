class PostsController < ApplicationController
 layout "admin"

    def new
        @post = Post.new
        @post.attachments.build
        @cats = @post.categories.build
    end

    def index
        @posts = Post.all
        @attachment = Attachment.all
    end

    def create
        @post = Post.new(post_params) #init model with attributes

        respond_to do |format|
        if @post.save #save model to db by mapping fields to columns
                format.html {redirect_to @post, notice: "Uploaded successfully"}
                format.json{
                responseText = {id: @attachment.id, thumb: view_context.image_tag(@attachment.url(:thumb))}
                render json: responseText, status: :created, location: @post
                }
        else
                format.html {render action:"new"}
                format.json {render json: @attachment.errors, status: "Cannot upload"}
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

    private
    def post_params
        params.require(:post).permit(:title, :content, :picture, :excerpt, :citations)
    end



 end
