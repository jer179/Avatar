(:collection('book3/?select=*.xml'):)

let $zuko-episodes := collection('book3/?select=*.xml')//atla[descendant::spkr[@ref="Zuko"]]
let $aang-episodes := collection('book3/?select=*.xml')//atla[descendant::spkr[@ref="Aang"]]

let $zuko-spkr := collection('book3/?select=*.xml')//spkr[@ref="Zuko"]
let $aang-spkr := collection('book3/?select=*.xml')//spkr[@ref="Aang"]

let $spkr := collection('book3/?select=*.xml')//spkr
let $zuko-count := $zuko-spkr => count() (:amount of episodes:)
let $aang-count := $aang-spkr => count()

let $aang-name := $aang-spkr/data(@ref) => distinct-values()
let $zuko-name := $zuko-spkr/data(@ref) => distinct-values()
let $all-name := $spkr/data(@ref) => distinct-values()
let $spkr-count := $spkr => count()
for $speaker in $all-name
let $spkr-speech-count := //scene/sp[spkr/data(@ref) = $speaker] => count() 
where $spkr-speech-count > 1
order by $speaker


let $zuko-ref := $zuko-episodes//spkr/data(@ref) (:characters interacting with zuko:)
let $aang-ref := $aang-episodes//spkr/data(@ref)

(:return (concat ("In the show, Avatar, the character ", $aang-name, " speaks ", $aang-count, " times.")):)

(:return (concat ("&#xa;", "In the show, Avatar, the character ", $speaker, " speaks ", $spkr-count, " times.")):)

return (concat ("&#xa;", "In the show, Avatar, the character ", $speaker, " speaks ", $spkr-speech-count, " times."))

(:values are innaccurate here for this last return. not sure why:)


