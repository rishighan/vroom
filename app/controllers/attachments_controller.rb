class AttachmentsController < ApplicationController
  before_filter :load_imageable

  def index
    @attachments = @imageable.attachments.all
  end

  def show
    @attachment = @imageable.attachments.find(params[:id])
  end

  def new
    @attachment = @imageable.attachments.build
  end

  def edit
    @attachment = @imageable.attachments.find(params[:id])
  end

  def create
    @attachment = @imageable.attachments.build(params[:attachment])
    @attachment.save
    redirect_to @imageable

  end

  def update
    @attachment = @imageable.attachments.find(params[:id])
    if @attachment.update_attributes(params[:attachment])
      redirect_to @imageable, notice: 'attachment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @attachment = @imageable.attachments.find(params[:id])
    @attachment.destroy
    redirect_to @imageable
  end

  def load_imageable
    resource, id = request.path.split('/')[1, 2]
    @imageable  = resource.singularize.classify.constantize.find(id)
  end
end
