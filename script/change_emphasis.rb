require '/home/dukefungi/sites/writegreenv3/config/environment'


id = 117
while id != 240
s = Sentence.find_by_id(id)
s.emphasis = "HealthEcon"
id += 1
s.save
end

id = 240
while id != 335
s = Sentence.find_by_id(id)
s.emphasis = "NationalSec"
id += 1
s.save
end

id = 335
while id != 364
s = Sentence.find_by_id(id)
s.emphasis = "EconGrowth"
id += 1
s.save
end

