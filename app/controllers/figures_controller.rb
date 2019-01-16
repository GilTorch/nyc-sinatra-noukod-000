class FiguresController < ApplicationController
  # add controller methods
  get "/figures/new" do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    @figure=Figure.new(@params[:figure])
    @figure.titles << Title.create(@params[:title])
    @figure.landmarks << Landmark.create(@params[:landmark])
    @figure.save
  end

end
