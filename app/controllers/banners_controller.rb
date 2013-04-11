class BannersController < ApplicationController
  before_filter :authenticate_user!
  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/new
  # GET /banners/new.json
  def new
    @banner = Banner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        format.html { redirect_to @banner, notice: 'Banner was successfully created.' }
        format.json { render json: @banner, status: :created, location: @banner }
      else
        format.html { render action: "new" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.json
  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to banners_url }
      format.json { head :no_content }
    end
  end

  def show_banner
    @ad_place = AdPlace.where(:code => params[:code]).first
    @banner = @ad_place.banners.where("banners.show_count < banners.show_max OR banners.show_count IS NULL OR banners.show_max = 0").order("updated_at").limit(1).first
    @place = @banner.placements.where(:ad_place_id => @ad_place).first

    @place.update_attributes :show_count => @place.show_count.to_i + 1
    @banner.update_attributes :show_count => @banner.show_count.to_i + 1

    # render :text => open(@banner.image.path, "rb").read
    render :text => "<a href=\"http://#{request.host}:#{request.port}/click_register/#{@place.id}\" target=\"_blank\"><img src=\"http://#{request.host}:#{request.port}/#{@banner.image.url}\" />"
  end

  def click_register
    @place = Placement.find params[:placement_id]
    @banner = @place.banner

    @place.update_attributes :click_count => @place.click_count.to_i + 1

    redirect_to @banner.url
  end
end
