class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to statuses_path, notice: 'Status was successfully created.'
    else
      render :new
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

def update
  @status = Status.find(params[:id])
  if @status.update(status_params)
    redirect_to statuses_path, notice: 'Status was successfully updated.'
  else
    render :edit
  end
end

  def show
    @status = Status.find(params[:id])
  end

  def upvote
    @status = Status.find(params[:id])
    @status.votes.create
    redirect_to statuses_path
  end

  private
  def status_params
    params.require(:status).permit(:message, :name, :like)
  end

  end
