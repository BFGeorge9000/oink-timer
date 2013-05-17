class TimersController < ApplicationController

  def index
    @timers = Timer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timers }
    end
  end

  def show
    @timer = Timer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timer }
    end
  end

  def new
    @timer = Timer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timer }
    end
  end

  def create
    @timer = Timer.new(params[:timer])

    respond_to do |format|
      if @timer.save
        format.html { redirect_to @timer, notice: 'Timer was successfully created.' }
        format.json { render json: @timer, status: :created, location: @timer }
      else
        format.html { render action: "new" }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timer = Timer.find(params[:id])
    @timer.destroy

    respond_to do |format|
      format.html { redirect_to timers_url }
      format.json { head :no_content }
    end
  end
end
