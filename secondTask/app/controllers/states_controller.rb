class StatesController < ApplicationController
  before_action :set_state, only: %i[update show destroy edit]

  def create
    state = State.create(state_params)

    redirect_to states_path(state)
  end

  def update
    @state.update(state_params)
    redirect_to states_path(@state)
    # в дагонку с redirect_to можно передать сообщение с помощью flash
  end

  def destroy
    @state.destroy

    redirect_to states_path(@state)
  end

  def show
  end

  def index
    @state = State.new
    @states = State.all
  end

  def new
    @state = State.new
  end

  def edit
  end

  private

  def state_params
    params.require(:state).permit(:body, :author)
  end

  def set_state
    @state = State.find(params[:id])
  end
end
