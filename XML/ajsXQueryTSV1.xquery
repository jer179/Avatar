declare option saxon:output "method=text";

let $book1 := collection('book1/Zuko/?select=*.xml')
let $book2 := collection('book2/Zuko/?select=*.xml')
let $book3 := collection('book3/Zuko/?select=*.xml')
let $book4 := collection('book1/Aang/?select=*.xml')
let $book5 := collection('book2/Aang/?select=*.xml')
let $book6 := collection('book3/Aang/?select=*.xml')
let $files := ($book1, $book2, $book3,$book4, $book5, $book6)
let $speeches := $files//sp
let $speakers := $speeches//spkr/data(@ref) => distinct-values()
 
for $spkr in $speakers
  let $s-speeches := $speeches[.//spkr/data(@ref) = $spkr]
   /string() ! normalize-space() => distinct-values()

    for $s-spch in $s-speeches
    
         let $referents := $speeches[./string() ! normalize-space() = $s-spch]
         //char/data(@ref) ! normalize-space() => distinct-values()
 for $r in $referents  

return concat($spkr, "&#x9;", "speaker", "&#x9;", $s-spch, "&#x9;", $r, "&#x9;", "referent", "&#10;")

