class PlatesController < ApplicationController
  # GET /plates
  # GET /plates.json
  def index
    @plates = Plate.all

    render json: @plates
  end

  # GET /plates/1
  # GET /plates/1.json
  def show
    @plate = Plate.find(params[:id])

    render json: @plate
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = Plate.new(params[:plate])

    if @plate.save
      render json: @plate, status: :created, location: @plate
    else
      render json: @plate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    @plate = Plate.find(params[:id])

    if @plate.update(params[:plate])
      head :no_content
    else
      render json: @plate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @plate = Plate.find(params[:id])
    @plate.destroy

    head :no_content
  end

  def add_problem
    @plate = Plate.find(params[:id])
    @problem = Problem.find(params[:problem_id])

    @plate.problems << @problem

    head :no_content
  end
end
