class TimersController < ApplicationController

  def index
    @timers = Timer.active.remaining_ascending

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timers }
    end
  end

  def new
    @timer = Timer.new
    Notification::VALID_TYPES.each do |type|
      @timer.send(:"build_#{type.underscore}")
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timer }
    end
  end

  def create
    @timer = Timer.new(params[:timer])

    respond_to do |format|
      if @timer.save
        format.html { redirect_to timers_path, notice: 'Timer was successfully created.' }
        format.json { render json: @timer, status: :created, location: @timer }
      else
        format.html { render action: "new" }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

end
