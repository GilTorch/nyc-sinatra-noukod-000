class FiguresController < ApplicationController
  # add controller methods
  get "/figures/new" do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"figures/new"
  end

  get "/figures/:id/edit" do
    @figure=Figure.find_by_id(@params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :"figures/edit"
  end

  get "/figures/:id" do
    @figure=Figure.find_by_id(@params[:id])

    erb :"figures/show"
  end

  get "/figures" do
    @figures=Figure.all
    erb :"figures/index"
  end

  post "/figures" do
    @figure=Figure.new(@params[:figure])
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save

    redirect "/figures/#{@figure.id}"

  end

  patch "/figures/:id" do
    @figure=Figure.find_by_id(@params[:id])
    @figure.name=@params[:figure][:name]
    @figure.titles << Title.create({name:@params[:title][:name]})
    @figure.landmarks << Landmark.create({name:@params[:landmark][:name]})
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
