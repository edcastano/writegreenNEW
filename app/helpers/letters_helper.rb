module LettersHelper

# Pulls a random "content stub" from the database givent the selection
  # 'Focus_header' variable is the title of the user selection (e.g. emphasis, ideology, content).
  # The 'Focus' variable is a variable for the specific user selection.  
def getcontent(focus, focus_header)
max = count_variations(focus, focus_header) 
counter = 1
text = ''
  while counter <= max
	text += ' ' + entry(focus, counter, focus_header)
	counter += 1	
  end   
  return text
end

# Reads the total number of entries for the 'focus'/'focus_head' selection.
def count_variations(focus, focus_header)
content_array = Sentence.where(focus_header.to_sym => focus)
content_array.maximum("order")
end 

# Pulls a random entry from the options available given the parameters
def entry(focus, sequence, focus_header)
sent_array = Sentence.where(
  focus_header.to_sym => focus,
  :order	=> sequence
  )
sentence = sent_array[rand(sent_array.length)]
return sentence.content
end



end
