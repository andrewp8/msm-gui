Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  # ------------director--------------
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/insert_director", { :controller => "directors", :action => "create" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/modify_director/:path_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })

  # --------------movie-----------------
  get("/movies", { :controller => "movies", :action => "index" })
  post("/insert_movie", {:controller => "movies", :action => "create"})
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/modify_movie/:path_id", {:controller => "movies", :action => "update"})
  get("/delete_movie/:path_id", {:controller => "movies", :action => "destroy"})
  
  # ------------actor--------------
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", {:controller => "actors", :action => "create"})
  post("/modify_actor/:path_id", {:controller => "actors", :action => "update"})
  get("/delete_actor/:path_id", {:controller => "actors", :action => "destroy"})
end
