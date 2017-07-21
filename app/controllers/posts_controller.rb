class PostsController < ApplicationController
 def new
    @post = Post.new
    @topic = Topic.find_by(id: params[:topic_id], forum_id: params[:forum_id])
  end

  def create
    @topic = Topic.find_by(id: params[:topic_id], forum_id: params[:forum_id])
    @post = Post.new(post_params)
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
    @post.update_attributes(post_params)
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

  private
  def post_params
    params.require(:post).permit(:content, :user_id, :topic_id)
  end
end
