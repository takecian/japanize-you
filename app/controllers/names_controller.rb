class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update, :destroy]
  autocomplete :name, :name, :full => true
  include Magick
  # GET /names
  # GET /names.json
  def index
    @names = Name.page(params[:page])
  end

  def search
    @name = Name.where(name: params[:search_names][:name]).first
    respond_to do |format|
      if @name != nil
        format.html { render "show" }
        format.json { render :json => @name.to_json }
        format.js
      else
        format.html { render root_path }
        format.json { render :json => {}.to_json }
        format.js
      end
    end
  end

  def image
    image_width = 480
    image_height = 240

    background_color = params[:background_color] ? '#' + params[:background_color] : 'blue'
    font_color = params[:font_color] ? '#' + params[:font_color] : 'white'
    name = params[:name]

    image = Magick::Image.new(image_width, image_height) { self.background_color = background_color }
    image.format = 'png'

    draw = Magick::Draw.new
    draw.annotate(image, 0, 0, 0, 0, name) do
      self.gravity = Magick::CenterGravity
      self.font = "#{Rails.root}/lib/assets/NotoSansCJKjp-Regular.otf"
      self.fill = font_color
      self.stroke = 'transparent'
      self.pointsize = (image_width - 20) / name.length
      self.text_antialias = true
      self.kerning = 1
    end

    send_data(image.to_blob, :disposition => "inline", :type => "image/png")
  end

  # GET /names/1
  # GET /names/1.json
  def show
  end

  # GET /names/new
  def new
    @name = Name.new
  end

  # GET /names/1/edit
  def edit
  end

  # POST /names
  # POST /names.json
  def create
    @name = Name.new(name_params)

    respond_to do |format|
      if @name.save
        format.html { redirect_to @name, notice: 'Name was successfully created.' }
        format.json { render :show, status: :created, location: @name }
      else
        format.html { render :new }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /names/1
  # PATCH/PUT /names/1.json
  def update
    respond_to do |format|
      if @name.update(name_params)
        format.html { redirect_to @name, notice: 'Name was successfully updated.' }
        format.json { render :show, status: :ok, location: @name }
      else
        format.html { render :edit }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    @name.destroy
    respond_to do |format|
      format.html { redirect_to names_url, notice: 'Name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @name = Name.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_params
      params.require(:name).permit(:name, :hiragana, :katakana)
    end
end
