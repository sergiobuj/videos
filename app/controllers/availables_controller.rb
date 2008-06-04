class AvailablesController < ApplicationController
## Se asegura de que solo se pueda accesar cuando hay una sesión abierta
before_filter :authorize
  
  # GET /availables
  # GET /availables.xml
  def index
    @availables = Available.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @availables }
    end
  end

  # GET /availables/1
  # GET /availables/1.xml
  def show
    @available = Available.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @available }
    end
  end

  # GET /availables/new
  # GET /availables/new.xml
  def new
    @available = Available.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @available }
    end
  end

  # GET /availables/1/edit
  def edit
    @available = Available.find(params[:id])
  end

  # POST /availables
  # POST /availables.xml
  def create
    @available = Available.new(params[:available])

    respond_to do |format|
      if @available.save
        flash[:notice] = 'Available was successfully created.'
        format.html { redirect_to(@available) }
        format.xml  { render :xml => @available, :status => :created, :location => @available }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @available.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /availables/1
  # PUT /availables/1.xml
  def update
    @available = Available.find(params[:id])

    respond_to do |format|
      if @available.update_attributes(params[:available])
        flash[:notice] = 'Available was successfully updated.'
        format.html { redirect_to(@available) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @available.errors, :status => :unprocessable_entity }
      end
    end
  end


## Elimina la información de disponibilidad de una pelicula.
  # DELETE /availables/1
  # DELETE /availables/1.xml
  def destroy
    @available = Available.find(params[:id])
    @available.destroy

    respond_to do |format|
      format.html { redirect_to(availables_url) }
      format.xml  { head :ok }
    end
  end
end
