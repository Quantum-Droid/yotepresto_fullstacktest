class PersonalReferencesController < ApplicationController
  before_action :set_personal_reference, only: [:show, :edit, :update, :destroy]

  # GET /personal_references
  # GET /personal_references.json
  def index
    @personal_references = PersonalReference.all
  end

  # GET /personal_references/1
  # GET /personal_references/1.json
  def show
  end

  # GET /personal_references/new
  def new
    @personal_reference = PersonalReference.new
  end

  # GET /personal_references/1/edit
  def edit
  end

  # POST /personal_references
  # POST /personal_references.json
  def create
    @personal_reference = PersonalReference.new(personal_reference_params)

    respond_to do |format|
      if @personal_reference.save
        format.html { redirect_to @personal_reference, notice: 'Personal reference was successfully created.' }
        format.json { render :show, status: :created, location: @personal_reference }
      else
        format.html { render :new }
        format.json { render json: @personal_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_references/1
  # PATCH/PUT /personal_references/1.json
  def update
    respond_to do |format|
      if @personal_reference.update(personal_reference_params)
        format.html { redirect_to @personal_reference, notice: 'Personal reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_reference }
      else
        format.html { render :edit }
        format.json { render json: @personal_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_references/1
  # DELETE /personal_references/1.json
  def destroy
    @personal_reference.destroy
    respond_to do |format|
      format.html { redirect_to personal_references_url, notice: 'Personal reference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_reference
      @personal_reference = PersonalReference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_reference_params
      params.require(:personal_reference).permit(:first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number, :requisition_id)
    end
end
