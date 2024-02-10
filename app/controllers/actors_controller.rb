class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    @actor = Actor.new
    @actor.name = params.fetch("query_name")
    @actor.dob = params.fetch("query_dob")
    @actor.bio = params.fetch("query_bio")
    @actor.image = params.fetch("query_image")

    if @actor.name.present?
      @actor.save
      redirect_to("/actors", {:notice => "Actor created successfully"})
    else
      redirect_to("/actors", {:notice => "Actor failed to create successfully"})
    end
  end

  def update
    the_id = params.fetch("path_id")
    @actor = Actor.find(the_id)
    @actor.name = params.fetch("query_name")
    @actor.dob = params.fetch("query_dob")
    @actor.bio = params.fetch("query_bio")
    @actor.image = params.fetch("query_image")

    if @actor.name.present?
      @actor.save
      redirect_to("/actors/#{@actor.id}", {:notice => "Actor updated successfully"})
    else
      redirect_to("/actors/#{@actor.id}", {:notice => "Actor failed to update successfully"})
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_director = Actor.find(the_id)
    the_director.destroy
    redirect_to("/actors", {:notice => "Actor deleted successfully"})
  end

  def max_dob
    directors_by_dob_desc = Actor.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end
end
