class BassesController < ApplicationController
  def index
    @basses = Bass.order(:name)
  end

  def show
    @bass = Bass.find(params[:id])
  end

  def new
    @manufacturers = Manufacturer.order(:name)
    @bass = Bass.new
  end

  def create
    @bass = Bass.new(bass_params)
    @bass.manufacturer = Manufacturer.find_by_id(params[:bass][:manufacturer].to_i)
    if @bass.save
      redirect_to bass_path(@bass)
    else
      render :new
    end
  end

  private

  def bass_params
    params.require(:bass).permit(:name, :year, :string_num, :fretless, :active)
  end
end
