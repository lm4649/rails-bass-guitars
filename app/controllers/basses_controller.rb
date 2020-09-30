class BassesController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]

      gears = Bass.where("name iLike '%#{params[:query]}%'")
      brands = Manufacturer.where("name iLike '%#{params[:query]}%'")
      artists = Artist.where("name iLike '%#{params[:query]}%'")
      songs = Song.where("title iLike '%#{params[:query]}%'")

      if gears.any? || brands.any? || artists.any? || songs.any?
        @basses = []
        @basses << gears
        @basses << brands.map { |brand| brand.basses }.flatten
        @basses << artists.map { |artist| artist.basses }.flatten
        @basses << songs.map { |song| song.bass }.flatten
        @basses.flatten!.uniq!
      else
        @basses = Bass.order(:name)
      end
    else
      @basses = Bass.order(:name)
    end
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
    params.require(:bass).permit(:name, :year, :string_num, :fretless, :active, photos: [])
  end
end
