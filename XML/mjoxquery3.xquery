

let $book1 := collection('book1//?select=*.xml')
(:let $book2 := collection('book2//?select=*.xml'):)
let $book3 := collection('book3//?select=*.xml')
(:let $books := ($book1, $book3):) (:book2 xml markup not completed:)

(:entire episodes contqaining zuko or aang speech:)
let $zuko-episodes := $book1//atla[descendant::spkr[@ref="Zuko"]]
let $aang-episodes := $book1//atla[descendant::spkr[@ref="Aang"]]

(:characters interacting with zuko or aang:)
let $zuko-ref := $zuko-episodes//spkr/data(@ref)
let $aang-ref := $aang-episodes//spkr/data(@ref)

(:each time zuko or aang spoke:)
let $zuko-spkr := $book3//spkr[@ref="Sokka"]
let $aang-spkr := $book1//spkr[@ref="Aang"]

(:each time any character spoke:)
let $spkr := $book1//spkr

(:amount of times zuko or aang spoke:)
let $zuko-count := $zuko-spkr => count() (:amount of episodes:)
let $aang-count := $aang-spkr => count()


(:<html>
    <head>
        <title>Avatar Table</title>
    </head>
    
        <body>
            <h1>Avatar Table</h1>
            <table border="1">
                <tr><th>Speaker</th><th>Speeches</th></tr>
                
                {
let $book1 := collection('book1//?select=*.xml')
(:let $book2 := collection('book2//?select=*.xml'):)
let $book3 := collection('book3//?select=*.xml')
let $books := ($book1, $book3) (:book2 xml markup not completed:)
let $zuko-spkr := $books//spkr[@ref="Zuko"]
let $aang-spkr := $books//spkr[@ref="Aang"]
let $spkr := $books//spkr
let $aang-name := $aang-spkr/data(@ref) => distinct-values()
let $zuko-name := $zuko-spkr/data(@ref) => distinct-values()
let $spkr-count := $spkr => count() 
let $all-name := $spkr/data(@ref) => distinct-values()
for $speaker in $all-name
let $spkr-speech-count := $books//scene/sp[spkr/data(@ref) = $speaker] => count() 
where $spkr-speech-count > 1
order by $speaker
return 
<tr><td>{$speaker}</td> <td>{$spkr-speech-count}</td></tr>}
           
           </table>
        </body>
</html>:)



(: RETURNS :)



(:return (concat ("In the show, Avatar, the character ", $aang-name, " speaks ", $aang-count, " times.")):)


return (" speaks ", $zuko-count, " times.")

(:return (concat ("&#xa;", "In the show, Avatar, the character ", $speaker, " speaks ", $spkr-count, " times.")):)

(:return (concat ("&#xa;", "In the show, Avatar, the character ", $speaker, " speaks ", $spkr-speech-count, " times.")):)




