declare option saxon:output "method=text";

let $book1 := collection('book1/all//?select=*.xml')
let $book2 := collection('book2/all//?select=*.xml')
let $book3 := collection('book3/all//?select=*.xml')
let $files := ($book1, $book2, $book3)
let $speeches := $files//sp
let $speakers := $speeches//spkr/data(@ref) => distinct-values()
 
for $spkr in $speakers

   let $s-speeches := $speeches[.//spkr/data(@ref) = $spkr]
   /line[1]/string() ! normalize-space() => distinct-values()

    for $s-spch in $s-speeches
    
         let $referents := $speeches[.//sp[1]/string() ! normalize-space() = $s-spch]
         //spkr/data(@ref) ! normalize-space() => distinct-values()

            for $r in $referents  

return concat($spkr, "&#x9;", "speaker", "&#x9;", $s-spch, "&#x9;", $r, "&#x9;", "referent", "&#10;")

