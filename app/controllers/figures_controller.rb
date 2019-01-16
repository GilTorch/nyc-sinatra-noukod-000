class FiguresController < ApplicationController
  # add controller methods
  get "/figures/new" do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"figures/new"
  end

  get "/figures" do 
    @figure=Figure.all 
    erb :"figures/index"
  end

  post "/figures" do
    @figure=Figure.new(@params[:figure])
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save

    redirect "/figures/#{@figure.id}"

  end

end
