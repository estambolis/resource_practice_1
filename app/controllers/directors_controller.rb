class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    render('show_details')
  end

  def new
  end

  def create_row
    d = Director.new
    d.dob = params[:dob]
    d.name = params[:name]
    d.bio = params[:bio]
    d.image_url = params[:image_url]

    d.save

    redirect_to("http://localhost:3000/directors/#{d.id}")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    d = Director.find(params[:id])

    d.dob = params[:the_dob]
    d.name = params[:the_name]
    d.bio = params[:the_bio]
    d.image_url = params[:the_image_url]

    d.save

    redirect_to("http://localhost:3000/directors/#{d.id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
