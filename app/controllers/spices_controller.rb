class SpicesController < ApplicationController
# ------------------------------------------------
# GET /spices: return an array of all spices

def index
    spices = Spice.all
    render json: spices
end

# POST /spices: create a new spice

def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
end

# PATCH /spices/:id: update an existing spice

def show
    spice = find_spice
    render json: spice
end

def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
end

# DELETE /spices/:id: delete an existing spice

def destroy
    spice = find_spice
    spice.destroy
    head :no_content
end

# STRONG PARAMS
private

def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end

def find_spice
    Spice.find(params[:id])
end

# ------------------------------------------------
end
