class FiguresController < ApplicationController
  # add controller methods
  get "/figures/new" do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    @figure=Figure.new(@params[:figure])
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save
  end

end
