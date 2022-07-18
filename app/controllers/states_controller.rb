class StatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    State.create(
      body: params[:state][:body],
      author: params[:state][:author]
    )
    riderect_to states_path
  end

  def update
    @state = State.find(params[:id])
    @state.update(
      body: params[:state][:body],
      author: params[:state][:author]
    )
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
  end

  def show
    @state = State.find(params[:id])
  end

  def index
    @states = State.all
  end

  def new
  end
end
