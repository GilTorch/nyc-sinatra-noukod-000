class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks/new" do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"landmarks/new"
  end

  get "/landmarks/:id/edit" do
    @figure=Figure.find_by_id(@params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"landmarks/edit"
  end

  get "/landmarks/:id" do
    @figure=Figure.find_by_id(@params[:id])

    erb :"landmarks/show"
  end

  get "/landmarks" do
    @landmarks=landmark.all
    erb :"landmarks/index"
  end

  post "/landmarks" do
    @landmark=Landmark.create(@params[:landmark])

    redirect "/landmarks/#{@landmark.id}"

  end

  patch "/landmarks/:id" do
    @figure=Figure.find_by_id(@params[:id])
    @figure.name=@params[:figure][:name]
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save

    redirect "/landmarks/#{@figure.id}"
  end
end
