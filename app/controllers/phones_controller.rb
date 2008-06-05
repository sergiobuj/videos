class PhonesController < ApplicationController
## Se asegura de que solo se pueda accesar cuando hay una sesión abierta
before_filter :authorize
  
  # GET /phones
  # GET /phones.xml
  def index
    @phones = Phone.find_all_by_code_person(params[ :code_person])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phones }
    end
  end

  # GET /phones/1
  # GET /phones/1.xml
  def show
    @phone = Phone.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/new
  # GET /phones/new.xml
  def new
    @person = Client.find_by_client_id(params[:person_id])# unless @persona.nil?
    #@persone = Employee.find_by_emp_id(params[:person_id]) unless @persona.nil?
    @phone = Phone.new
    @phone.code_person = @person.client_id # unless @persona.nil?
    #@phone.code_person = @persone.emp_id unless @persona.nil?
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/1/edit
  def edit
    @phone = Phone.find(params[:id])
  end

  # POST /phones
  # POST /phones.xml
  def create
    @phone = Phone.new(params[:phone])
    respond_to do |format|
      if @phone.save
        flash[:notice] = 'Phone was successfully created.'
        format.html { redirect_to(@phone) }
        format.xml  { render :xml => @phone, :status => :created, :location => @phone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phones/1
  # PUT /phones/1.xml
  def update
    @phone = Phone.find(params[:id])
    respond_to do |format|
      if @phone.update_attributes(params[:phone])
        flash[:notice] = 'Phone was successfully updated.'
        format.html { redirect_to(@phone) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.xml
  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to(phones_url) }
      format.xml  { head :ok }
    end
  end
end
