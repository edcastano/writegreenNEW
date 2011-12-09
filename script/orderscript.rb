require './config/environment'


# Script to add "1" to the order of all the "component" content type. 
# Used so it works with getparagraph helper method
id = 1487
while id != 1618
s = Sentence.find_by_id(id)
s.component = s.component.strip
id += 1
s.save
end


