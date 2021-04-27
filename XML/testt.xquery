let $book1 := collection('book1/zuko/?select=*.xml')
let $book2 := collection('book2/zuko/?select=*.xml')
let $book3 := collection('book3/zuko/?select=*.xml')
let $book4 := collection('book1/aang/?select=*.xml')
let $book5 := collection('book2/aang/?select=*.xml')
let $book6 := collection('book3/aang/?select=*.xml')
let $files := ($book1, $book2, $book3,$book4, $book5, $book6)
let $speeches := $files//sp
let $speakers := $speeches//spkr/data(@ref) => distinct-values()

return $speakers