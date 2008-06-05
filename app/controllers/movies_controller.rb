class MoviesController < ApplicationController
## Se asegura de que solo se pueda accesar cuando hay una sesión abierta
before_filter :authorize
  
  
  ##Método que muestra en pantalla la lista de todas las peliculas registrdas
  # GET /movies
  # GET /movies.xml
  def index
    @movies = Movie.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end
    
  end

  ##método que muetsra La información de una pelicula seleccionada
  # GET /movies/1
  # GET /movies/1.xml
  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie }
    end
  end
  
  # working coll <%= collection_select( :category_code, :category_code,  @categories, :category_code, :category_name ) %>


  ##Método para crear una pelicula nueva ...(añadir direccionamiento a disponibilidad y cast)
  # GET /movies/new
  # GET /movies/new.xml
  def new
    @movie = Movie.new
    @categories = Category.find(:all)
    @category = Category
    if @category.count.zero?
    	redirect_to(Category.new)
    	flash[:notice] = 'At least one category has to be created'
    else
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie }
    end
    end
  end

  ## Sirve para entrar a editar una pelicula que existe en al base de datos
  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    @categories=Category.find(:all)
  end

  ##Método que se llama para crear la entrada de la pelicula en la base de datos
  # POST /movies
  # POST /movies.xml
  def create
    @movie = Movie.new(params[:movie])
    respond_to do |format|
      if @movie.save
        flash[:notice] = 'Movie successfully created.'
        format.html { redirect_to(@movie) }
        format.xml  { render :xml => @movie, :status => :created, :location => @movie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  ##Guarda los cambios hechos a una pelicula en 'edit'
  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @movie = Movie.find(params[:id])
    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        flash[:notice] = 'Movie was successfully updated.'
        format.html { redirect_to(@movie) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  ##Elimina una pelicula
  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to(movies_url) }
      format.xml  { head :ok }
    end
  end
  
  
   # @movie = Movie.find(:all, :conditions => ["movie.category_code = ?" "#{@category.category_code}"])
   #<td><%= link_to "Movies in this category" , :controller => 'movies', :action => 'ca', :category_id => category.id %></td>
   #@movies = Movie.find(:all)
   #@movie = Movie.find(:all,  :conditions => ["category_code = ?","#{@category.category_code}"] )#(:category_code['#{:category.category_code}' )
#(:category_code['#{:category.category_code}' )

   def av      
      @movies = Movie.find_all_by_available(true)#(:category_code['#{:category.category_code}' )
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end
   end
   
   def showincategory
    @movies = Movie.find_all_by_category_code(params[:category_code])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end  
   end
   
   
  
end
