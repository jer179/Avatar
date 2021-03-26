
(:let $book1Episodes := $book1/atla
let $aangEpisodes := $book1Episodes[.//spkr="Aang"]
let $aangSpeeches := $book1Episodes//sp[child::spkr = "Aang"]
let $aangTitles := $aangEpisodes//head/episode ! string()
return $aangTitles:)
let $book := collection('book1/?select=*.xml')
let $sp := $book//sp
let $speakers := $sp//spkr/data(@ref)=> distinct-values()
let $sp-count := $sp => count()
for $spkr in $speakers
let $spkr-sp-count := //body/scene/sp/[spkr/data(@ref) = $spkr] => count()
(:where $spkr-sp-count > 1:)
return (concat ("&#xa;", "In Book One: Water, the character ", $spkr, " speaks ", $spkr-sp-count, " times."))