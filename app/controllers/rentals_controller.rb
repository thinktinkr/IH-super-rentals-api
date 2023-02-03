# frozen_string_literal: true

class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update destroy]

  # One or more of the following keys must be present: "data", "errors", "meta".

  # GET /rentals or /rentals.json
  def index
    # @rentals = Rental.all
    # warn "DEBUG: index - #{request.url}"
    render json: RentalSerializer.new(Rental.all).as_json
  end

  # GET /rentals/1 or /rentals/1.json
  def show
    # warn "DEBUG: show - #{request.url}"
    render json: RentalSerializer.new(@rental).as_json
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit; end

  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to rental_url(@rental), notice: I18n.t('rental.created') }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1 or /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to rental_url(@rental), notice: I18n.t('rental.updated') }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1 or /rentals/1.json
  def destroy
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to rentals_url, notice: I18n.t('rental.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rental
    @rental = Rental.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rental_params
    params.require(:rental).permit(:id, :title, :owner, :city, :latitude, :longitude, :category, :bedrooms, :image,
                                   :description)
  end
end
