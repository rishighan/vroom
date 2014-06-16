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
            format.html {redirect_to @post, notice: "Post was successfully saved."}
            format.json {
                data = {id:@post.id, thumb: view_context.image_tag(@post.attachments(:medium))}
                render json: data, status: :created, location: @post
            }
        else
            format.html{render 'new'}
            format.json{render json: @post.errors, status:"Can't process this entity"}
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
