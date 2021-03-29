
(:
let $book1 := collection('book1//?select=*.xml')
let $book3 := collection('book3//?select=*.xml')
let $books := ($book1, $book3)

let $sp := $book//sp
let $speakers := $sp//spkr/data(@ref)=> distinct-values()
let $sp-count := $sp => count()
for $spkr in $speakers
let $spkr-sp-count := $book//body/scene/sp[spkr/data(@ref) = $spkr] => count()
where $spkr-sp-count > 1

return (concat ("&#xa;", "In Book One: Water, the character ", $spkr, " speaks ", $spkr-sp-count, " times."))
:)

<html>
    <head>
        <title>Book 1/2 Speech Count</title>
    </head>
    
        <body>
            <h1>Book 1/2 Speech Count</h1>
            <table>
                <tr><th>Character</th><th>Number of Speeches</th></tr>
                
                {
let $book1 := collection('book1//?select=*.xml')
let $book3 := collection('book3//?select=*.xml')
let $books := ($book1, $book3)                
let $sp := $books//sp
let $speakers := $sp//spkr/data(@ref)=> distinct-values()
let $sp-count := $sp => count()
for $spkr in $speakers
let $spkr-sp-count := $books//body/scene/sp[spkr/data(@ref) = $spkr] => count()
where $spkr-sp-count > 1
order by $spkr-sp-count descending
return 
<tr><td>{$spkr}</td> <td>{$spkr-sp-count}</td></tr>}
           
           </table>
        </body>
</html>




