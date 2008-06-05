class RentsController < ApplicationController
## Se asegura de que solo se pueda accesar cuando hay una sesión abierta
before_filter :authorize
  # GET /rents
  # GET /rents.xml
  def index
    @rents = Rent.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rents }
    end
  end

  # GET /rents/1
  # GET /rents/1.xml
  def show
    @rent = Rent.find(params[:id])
    @movie = Movie.find_by_movie_code(@rent.movie_code).movie_title
        @client = Client.find_by_client_code(@rent.client_code).client_name
            @emp = Employee.find_by_emp_code(@rent.emp_code).emp_name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rent }
    end
  end

  # GET /rents/new
  # GET /rents/new.xml
  def new
    @rent = Rent.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rent }
     ## @movie = Movie.find(params :)

    end
  end

  # GET /rents/1/edit
  def edit
    @rent = Rent.find(params[:id])
  end

  # POST /rents
  # POST /rents.xml
  def create
    @rent = Rent.new(params[:rent])

    respond_to do |format|
      if @rent.save
        @movie = Movie.find_by_movie_code(@rent.movie_code)
        @movie.available=false
        @movie.save
        flash[:notice] = 'Rent was successfully created.'
        format.html { redirect_to(@rent) }
        format.xml  { render :xml => @rent, :status => :created, :location => @rent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rents/1
  # PUT /rents/1.xml
  def update
    @rent = Rent.find(params[:id])

    respond_to do |format|
      if @rent.update_attributes(params[:rent])
        flash[:notice] = 'Rent was successfully updated.'
        format.html { redirect_to(@rent) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rent.errors, :status => :unprocessable_entity }
      end
    end
  end



  # DELETE /rents/1
  # DELETE /rents/1.xml
  def destroy
    @rent = Rent.find(params[:id])
    @movie = Movie.find_by_movie_code(@rent.movie_code)
    @movie.available=true
    @movie.save
    @return = Return.find_by_rent_code(@rent.rent_code)
    @return.destroy
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to(rents_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def rented
    @rents = Rent.find_all_by_client_code(params[:client_code])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rents }
    end
  end
    def rentedemp
    @rents = Rent.find_all_by_emp_code(params[:emp_code])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rents }
    end
  end
  
  
  
end
