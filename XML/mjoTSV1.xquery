(: SAMPLE STRUCTURE OF XQUERY FOR TSV  :)
(: The strucure here assumes that you have element nodes at the sub-file level that share the source, 
bridge, and target nodes as attribute values. If your main items are whole files rather than sub-file
elements, or if your source/bridge/target nodes are elements or text strings, the same general concepts
apply, but your XPath statements will be different. :)

declare option saxon:output "method=text";
(: The line above tells it to omit the xml declaration from the output file. 
Save output with .tsv file extension. :)

let $files := collection('book1/all//?select=*.xml')
let $sourceNodes := $files//spkr/data(@ref) ! normalize-space () => distinct-values ()

(: This will tunnel down within each file to the identified source nodes in every file 
and render a non-repeating list. normalize-space () ensures that extra whitespaces do not
cause XQuery to misread the same node as two different things. :)

for $s in $sourceNodes   (: First loop: run everything that follows for each distinct sourceNode. :)

(: Now for each distinct sourceNode, find all the different bridge elements: :)
let $bridgeNodes := $files/atla[.//spkr/data(@ref) = $s]
    //spkr/data(@ref) ! normalize-space () => distinct-values ()

for $b in $bridgeNodes   (: For each distinct bridgeElement, find each distinct targetNode. :)

let $targetNodes := $files/atla[.//spkr/data(@ref) = $b]
    //spkr/string() ! normalize-space () => distinct-values ()
(: You need to decide whether you want to count the distinct-values or not: experiment to see the difference. :)
    
for $t in $targetNodes   (: Output a separate line for each distinct targetNode. :)
    
return concat($s, "&#x9;", $b, "&#x9;", $t, "&#10;")

