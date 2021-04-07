declare variable $book1 := collection('book1//?select=*.xml');
declare variable $book2 := collection('book1//?select=*.xml');
declare variable $book3 := collection('book3//?select=*.xml');
declare variable $books := ($book1,$book2, $book3)  ;       
declare variable $speech := $books//sp;
declare variable $speakers := $speech//spkr/data(@ref)=> distinct-values();
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html>
    <head>
        <title>Avatar</title>
    </head>
    <body>
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
            <g transform="translate(150,100)">
                <g>
                    {
                    for $spkr at $pos in $speakers
                    let $spkr-speech-count := $books//Q{}sp/Q{}spkr[data(@ref) = $spkr] => count()
                    (:where $spkr-speech-count > 1 This has been eliminated:)
                    (:order by $spkr-speech-count descending  This isn't working :)
                    return
                    <g>
                        <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr}</text>
                        <line x1="0" y1="{$pos * $yspacer}" x2="{$spkr-speech-count * $xspacer}" y2="{$pos * $yspacer}" stroke="blue" stroke-width="15"/>
                        <text x="{$spkr-speech-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr-speech-count}</text>
                        <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                    </g>
                    }
                </g>
            </g>
        </svg>
    </body>
</html>