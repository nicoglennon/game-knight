class PostsController < ApplicationController
 def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to "/forums/#{@post.topic.forum_id}/topics/#{@post.topic_id}"
    else
      @errors = ["Invalid input."]
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    if @post.valid?
      redirect_to "/forums/#{@post.topic.forum_id}/topics/#{@post.topic_id}"
    else
      @errors = ["Invalid input."]
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to "/forums/#{@post.topic.forum_id}/topics/#{@post.topic_id}"
  end
end
