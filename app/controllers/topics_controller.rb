class TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
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
    @topic.update_attributes(params[:topic])
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
end
