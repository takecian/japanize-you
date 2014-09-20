class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update, :destroy]

  # GET /names
  # GET /names.json
  def index
    @names = Name.page(params[:page])
  end

  def search
    @name = Name.where(name: params[:q]).first
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
