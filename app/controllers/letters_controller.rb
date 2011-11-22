class LettersController < ApplicationController
  # GET /letters
  # GET /letters.json
  
    
  def index
    @letters = Letter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @letters }
    end
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    #@letter = Letter.find(params[:id])
  @name = params[:name]
  @street_address = params[:street_address]
  @city = params[:city]
  @state = params[:state]
  @zipcode = params[:zipcode]
  @address = @street_address + ' ' + @city + ", " + @state + ' ' + @zipcode

  @emphasis = params[:emphasis]
  if @emphasis != nil
      @emphasis = params[:emphasis]
	  @political_ideology = params[:ideology]
	  @religion = params[:religion]
	  @ideologyKey = @political_ideology + @religion
	  @geography = params[:geography]
      @recipient = params[:recipient]
  else
    @recipient_lastname = " Representative"
  end
 
	@congresspeople = Sunlight::Legislator.all_for(:address => @address)
	@senior_senator = @congresspeople[:senior_senator]
	@junior_senator = @congresspeople[:junior_senator]
	@representative = @congresspeople[:representative]

    @sen_senator_title = 'Senator '+@senior_senator.firstname + " " + @senior_senator.lastname 
	@jun_senator_title = 'Senator '+@junior_senator.firstname + " " + @junior_senator.lastname
	@rep_title = 'Representative '+@representative.firstname + " " + @representative.lastname 

	@sen_senator_address = @senior_senator.congress_office 
	@jun_senator_address = @junior_senator.congress_office
	@rep_address = @representative.congress_office 

	@sen_senator_title_lastname = 'Senator' + ' ' + @senior_senator.lastname 
	@jun_senator_title_lastname = 'Senator' + ' ' + @junior_senator.lastname 
	@rep_title_lastname = 'Representative' + ' ' + @representative.lastname 

	@sen_senator_name = @senior_senator.firstname + " " + @senior_senator.lastname 
	@jun_senator_name = @junior_senator.firstname + " " + @junior_senator.lastname 
	@rep_name = @representative.firstname + " " + @representative.lastname 

	@rep_address = Hash[[[@sen_senator_title, @sen_senator_address], [@jun_senator_title, @jun_senator_address], [@rep_title, @rep_address]]]  
	@rep_lastname = Hash[[[@sen_senator_title, @sen_senator_title_lastname], [@jun_senator_title, @jun_senator_title_lastname], [@rep_title, @rep_title_lastname]]]  
	@rep_name = Hash[[[@sen_senator_title, @sen_senator_name], [@jun_senator_title, @jun_senator_name], [@rep_title, @rep_name]]]  
	   if @rep_address[@recipient] != nil 
	   @recipient_address = @rep_address[@recipient] 
	   @recipient_lastname = @rep_lastname[@recipient] 
	   @recipient_name = @rep_name[@recipient]	  
	   end 
 
   
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/new
  # GET /letters/new.json
  def new
    #@letter = Letter.new
  @recipient = nil 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/1/edit
  def edit
    @letter = Letter.find(params[:id])
  end

  # POST /letters
  # POST /letters.json
  def create
    #@letter = Letter.new(params[:letter])

    respond_to do |format|
      if @letter.save
        format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
        format.json { render json: @letter, status: :created, location: @letter }
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /letters/1
  # PUT /letters/1.json
  def update
    #@letter = Letter.find(params[:id])

    respond_to do |format|
      if @letter.update_attributes(params[:letter])
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy

    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :ok }
    end
  end
end
