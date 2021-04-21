(: Zuko Collection :)
declare variable $book1Z := collection('book1/zuko//?select=*.xml');
declare variable $book2Z := collection('book2/zuko//?select=*.xml');
declare variable $book3Z := collection('book3/zuko//?select=*.xml');
declare variable $speechZ := ($book1Z, $book2Z, $book3Z);

(: Aang Collection :)
declare variable $book1A := collection('book1/aang//?select=*.xml');
declare variable $book2A := collection('book2/aang//?select=*.xml');
declare variable $book3A := collection('book3/aang//?select=*.xml');
declare variable $speechA := ($book1A, $book2A, $book3A);

declare variable $speakersAll := ($book1A, $book2A, $book3A, $book1Z, $book2Z, $book3Z);

declare variable $speakers := $speakersAll//spkr/data(@ref) => distinct-values();
declare variable $speakersZ := $speechZ//spkr/data(@ref) => distinct-values();
declare variable $speakersA := $speechA//spkr/data(@ref) => distinct-values();
declare variable $xspacer := 10;
declare variable $yspacer := 25;



<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="100" y="-5" font-family="sans-serif" font-size="20px" fill="black">Character Appearances with Zuko and Aang</text>
    </g>
    <g>
    
        {
        for $speaker at $pos in $speakers
        let $spkr-speech-countZ := $speechZ//Q{}scene/Q{}sp[Q{}spkr/data(@ref) = $speaker]/.. => count()
        let $spkr-speech-countA := $speechA//Q{}scene/Q{}sp[Q{}spkr/data(@ref) = $speaker]/.. => count()       
        return
            <g>
            <!-- ZUKO -->
            <!-- NAME -->
            <text x="-60" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="13px" fill="black">{$speaker}</text>
            <!-- RED ZUKO BAR -->
            <line x1="300" y1="{$pos * $yspacer}" x2="{(300 + (-$spkr-speech-countZ * $xspacer))}" y2="{$pos * $yspacer}" stroke="red" stroke-width="15"/>
            <!-- NUMBER -->
            <text x="{(300 + (-$spkr-speech-countZ * $xspacer)) - 20}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr-speech-countZ}</text>
            
            <!-- VERTICAL DIVIDER -->
            <line x1="300" y1="0" x2="300" y2="{max($pos + 1) * $yspacer}" stroke="black" stroke-width="4"/>
            
            
            <!-- AANG -->
            <!-- BLUE AANG BAR -->
            <line x1="300" y1="{$pos * $yspacer}" x2="{(300 + ($spkr-speech-countA * $xspacer))}" y2="{$pos * $yspacer}" stroke="blue" stroke-width="15"/>
            <!-- NUMBER -->
            <text x="{(300 + ($spkr-speech-countA * $xspacer)) + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr-speech-countA}</text>
            <!--<line x1="0" y1="0" x2="0" y2="{max($posA + 1) * $yspacer}" stroke="black" stroke-width="2"/>-->
            
            
        </g>
        }
        </g>
        </g>
</svg>