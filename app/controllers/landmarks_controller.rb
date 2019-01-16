class LandmarksController < ApplicationController
  # add controller methods
  get "/lanmarks/new" do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"lanmarks/new"
  end

  get "/lanmarks/:id/edit" do
    @figure=Figure.find_by_id(@params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"lanmarks/edit"
  end

  get "/lanmarks/:id" do
    @figure=Figure.find_by_id(@params[:id])

    erb :"lanmarks/show"
  end

  get "/lanmarks" do
    @figures=Figure.all
    erb :"lanmarks/index"
  end

  post "/lanmarks" do
    @figure=Figure.new(@params[:figure])
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save

    redirect "/lanmarks/#{@figure.id}"

  end

  patch "/lanmarks/:id" do
    @figure=Figure.find_by_id(@params[:id])
    @figure.name=@params[:figure][:name]
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save

    redirect "/lanmarks/#{@figure.id}"
  end
end
