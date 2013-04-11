class AdPlacesController < ApplicationController
  before_filter :authenticate_user!

  helper_method :all_banners, :checked_banners

  # GET /ad_places
  # GET /ad_places.json
  def index
    @ad_places = AdPlace.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ad_places }
    end
  end

  # GET /ad_places/1
  # GET /ad_places/1.json
  def show
    @ad_place = AdPlace.find(params[:id])
    @placements = @ad_place.placements

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad_place }
    end
  end

  # GET /ad_places/new
  # GET /ad_places/new.json
  def new
    @ad_place = AdPlace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad_place }
    end
  end

  # GET /ad_places/1/edit
  def edit
    @ad_place = AdPlace.find(params[:id])
  end

  # POST /ad_places
  # POST /ad_places.json
  def create
    @ad_place = AdPlace.new(params[:ad_place])

    respond_to do |format|
      if @ad_place.save
        format.html { redirect_to @ad_place, notice: 'Ad place was successfully created.' }
        format.json { render json: @ad_place, status: :created, location: @ad_place }
      else
        format.html { render action: "new" }
        format.json { render json: @ad_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ad_places/1
  # PUT /ad_places/1.json
  def update
    @ad_place = AdPlace.find(params[:id])

    respond_to do |format|
      if @ad_place.update_attributes(params[:ad_place])
        format.html { redirect_to @ad_place, notice: 'Ad place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_places/1
  # DELETE /ad_places/1.json
  def destroy
    @ad_place = AdPlace.find(params[:id])
    @ad_place.destroy

    respond_to do |format|
      format.html { redirect_to ad_places_url }
      format.json { head :no_content }
    end
  end

  protected

  def all_banners
    @all_banners ||= Banner.all
  end

  def checked_banners
    @checked_banners ||= @ad_place.banners.map(&:id)
  end
end
