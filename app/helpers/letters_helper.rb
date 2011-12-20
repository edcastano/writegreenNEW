module LettersHelper

# Pulls a random "content stub" from the database givent the selection
  # 'Focus_header' variable is the title of the user selection (e.g. emphasis, ideology, content).
  # The 'Focus' variable is a variable for the specific user selection.  

def get_content(focus, focus_header)
  (1..count_variations(focus, focus_header)).collect{|counter| pull_entry(focus, counter, focus_header)}.join(' ').squish
end

# Reads the total number of entries for the 'focus'/'focus_head' selection.
def count_variations(focus, focus_header)
content_array = Sentence.where(focus_header.to_sym => focus)
content_array.maximum("order")
end 

# Pulls a random pull_entry from the options available given the parameters
def pull_entry(focus, sequence, focus_header)
entry_array = Sentence.where(
  focus_header.to_sym => focus,
  :order	=> sequence
  )
sentence = entry_array[rand(entry_array.length)]
return sentence.content
end

#Letter builders

#Polutes the rep's address
def rep_address
"\n" + @recipient_name + "\n" + @recipient_address + 
"\n" + "Washington DC 20510" + "\n"   
end

def greeting
"\n" + @recipient_lastname + ","
end

#Populates the paragraph, 'a', 'b' & 'c' are the order of each paragraph
def body

  @r = rand(3)
 if @r == 1 
  "\n\n" + get_content('Intro', 'component') + " " + 
  get_content(@emphasis, "emphasis") + "\n\n" +
  get_content(@ideologyKey, "ideology")  + "\n\n" +
  if @geography != "Other" 
  get_content(@geography, "geography") 
  end 
 elsif @r == 2  
  "\n\n" + get_content('Intro', 'component') + " " +
  get_content(@ideologyKey, "ideology") +
  "\n\n" + get_content(@emphasis, "emphasis") +
	if @geography != "Other" 
	"\n\n" + get_content(@geography, "geography") 
	end 
 else  
	 "\n\n" + get_content('Intro', 'component') + " " +
	 get_content(@emphasis, "emphasis") +
	 if @geography != "Other" 
	 "\n\n" + get_content(@geography, "geography") 		   
	 end +
	 "\n\n" + get_content(@ideologyKey, "ideology")
 end 	
end

def closing   
  @c = rand(2)
	if @c == 1 
	"\n\n" + get_content('WrapupOptionA', 'component') + "\n\n" +
	get_content('Closing', 'component') + "\n" +
	writer_address
  else 
    @v = rand(2) 
	  if @v == 1 
	  "\n\n" + get_content('WrapupOptionA', 'component') + "  " +
		get_content('WrapupOptionB', 'component') + ":" + "\n" +
		writer_address + "\n\n" +
		get_content('Closing', 'component') + "\n\n" +
    @name
    else 
    "\n\n" + get_content('WrapupOptionB', 'component') + ":" + "\n" +
		writer_address + "\n\n" +
		get_content('WrapupOptionA', 'component') + "\n" +
    get_content('Closing', 'component') + "\n" +
    @name
    end 
  end 
end

def writer_address
  "\n" +
  @name + "\n" +
  @street_address + "\n" +
	@city + ", " + @state + " " + @zipcode  
end
 
def letter
rep_address + greeting + body + closing
end

end
