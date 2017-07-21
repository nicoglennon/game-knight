class TopicsController < ApplicationController

  def show
    @topic = Topic.find_by(id: params[:id], forum_id: params[:forum_id])
    p "*******************************************"
    p params
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to "/forums/#{@topic.forum_id}"
    else
      @errors = ["Invalid input."]
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(topic_params)
    if @topic.valid?
      redirect_to "/forums/#{@topic.forum_id}"
    else
      @errors = ["Invalid input."]
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy!
    redirect_to "/forums/#{@topic.forum_id}"
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description, :user_id, :forum_id)
  end
end
