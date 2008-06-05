class ReturnsController < ApplicationController

## Se asegura de que solo se pueda accesar cuando hay una sesión abierta
before_filter :authorize


  # GET /returns
  # GET /returns.xml
  def index
    @returns = Return.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @returns }
    end
  end

  # GET /returns/1
  # GET /returns/1.xml
  def show
    @return = Return.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @return }
    end
  end

  # GET /returns/new
  # GET /returns/new.xml
  def new
    @return = Return.new
    @return.charges = 0
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @return }
    end
  end

  # GET /returns/1/edit
  def edit
    @return = Return.find(params[:id])
  end

  # POST /returns
  # POST /returns.xml
  def create
    @return = Return.new(params[:return])
    @rent = Rent.find_by_rent_code(@return.rent_code)
    @movie = Movie.find_by_movie_code(@rent.movie_code)
    @movie.available=true
    @movie.save
    @rent.alive =false
    @rent.save
    respond_to do |format|
      if @return.save
        flash[:notice] = 'Return was successfully created.'
        format.html { redirect_to(@return) }
        format.xml  { render :xml => @return, :status => :created, :location => @return }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @return.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /returns/1
  # PUT /returns/1.xml
  def update
    @return = Return.find(params[:id])

    respond_to do |format|
      if @return.update_attributes(params[:return])
        flash[:notice] = 'Return was successfully updated.'
        format.html { redirect_to(@return) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @return.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /returns/1
  # DELETE /returns/1.xml
  def destroy
    @return = Return.find(params[:id])
    @rent = Rent.find_by_rent_code(@return.rent_code)
    @rent.alive =true
    @rent.save
    @return.destroy

    respond_to do |format|
      format.html { redirect_to(returns_url) }
      format.xml  { head :ok }
    end
  end
end
