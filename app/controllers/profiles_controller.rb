class ProfilesController < ApplicationController
  before_action :set_user
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if !@user.has_profile?
      redirect_to new_profile_path
      return
    end

    @profile = @user.profile
    render :show, location: @profile
  end

  # GET /profiles/new
  def new
    if @user.has_profile?
      redirect_to @user.profile, notice: @user.has_complete_profile_message
      return
    end
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @user.profile = @profile
    @user.save
    puts "LOG: created profile #{@user.profile} to user #{@user}"

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # --- PRIVATE METHODS ---

  private
    def set_user
      @user = current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = @user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :second_name, :first_last_name, :second_last_name, :birth_date, :curp, :rfc, :gender, :birth_state, :phone_number)
    end
end
