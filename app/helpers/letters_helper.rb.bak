module LettersHelper




def set(focus, focus_header)
content_array = Sentence.where(focus_header.to_sym => focus)
@num_sentences = content_array.maximum("order")
end 

def entry(focus, sequence, focus_header)
d = "ideology"
sent_array = Sentence.where(
  focus_header.to_sym => focus,
  :order	=> sequence
  )
sentence = sent_array[rand(sent_array.length)]
return sentence.content
end

def getparagraph(focus, focus_header)
max = set(focus, focus_header)
counter = 1
text = ''
  while counter <= max 
	text += ' ' + entry(focus, counter, focus_header)
	counter += 1	
  end   
  return text
end


end
