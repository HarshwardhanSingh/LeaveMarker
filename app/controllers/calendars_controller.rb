# Handles Calendars
class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_calendars
  end

  def show
    load_calendar
  end

  def new
    build_calendar
  end

  def create
    build_calendar
    save_calendar
  end

  def edit
    load_calendar
  end

  def update
    load_calendar
    update_calendar
  end

  def destroy
    load_calendar
    @calendar.destroy
    redirect_to calendars_path, flash: { notice: 'Calendar Destroyed' }
  end

  private

  def calendar_params
    calendar_params = params[:calendar]
    calendar_params ? calendar_params.permit(:name, :description) : {}
  end

  def load_calendars
    @calendars ||= current_user.calendars.all.order(created_at: :desc)
  end

  def load_calendar
    @calendar ||= Calendar.find(params[:id])
  end

  def build_calendar
    @calendar ||= Calendar.new(calendar_params)
    @calendar.user = current_user
  end

  def save_calendar
    if @calendar.save!
      redirect_to calendar_path(@calendar), flash:
        { notice: 'Calendar Created' }
    else
      render 'new', flash: { error: 'Somethind went wrong!!' }
    end
  end

  def update_calendar
    if @calendar.update(calendar_params)
      redirect_to calendar_path(@calendar), flash:
        { notice: 'Calendar Updated' }
    else
      render 'edit', flash: { error: 'Something went wrong!!' }
    end
  end
end
