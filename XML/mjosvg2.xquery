(:
let $book1 := collection('book1//?select=*.xml')
(:let $book2 := collection('book2//?select=*.xml'):)
let $book3 := collection('book3//?select=*.xml')
(:let $books := ($book1, $book3):) (:book2 xml markup not completed:)
:)

declare variable $speech := collection('book1/Aang//?select=*.xml')//scene;
declare variable $speechA := collection('book1/Aang//?select=*.xml')//scene;
declare variable $speakers := $speech//spkr/data(@ref) => distinct-values();
declare variable $speakersA := $speechA//spkr/data(@ref) => distinct-values();
declare variable $xspacer := 10;
declare variable $yspacer := 25;




<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-family="sans-serif" font-size="20px" fill="black">Speaker Frequencies in Avatar</text>
    </g>
    <g>
    {
        for $spkr at $pos in $speakers
        let $spkr-speech-count := collection('book1//?select=*.xml')//Q{}scene/Q{}sp[Q{}spkr/data(@ref) = $spkr] => count()
        return
            <g>
            <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr}</text>
            <line x1="0" y1="{$pos * $yspacer}" x2="{$spkr-speech-count * $xspacer}" y2="{$pos * $yspacer}" stroke="blue" stroke-width="15"/>
            <text x="{$spkr-speech-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr-speech-count}</text>
            <line x1="0" y1="0" x2="0" y2="{max($pos + 1) * $yspacer}" stroke="black" stroke-width="2"/>
        </g>
        }
        </g>
        </g>
</svg>