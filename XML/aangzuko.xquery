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

declare variable $speakersZ := $speechZ//spkr/data(@ref) => distinct-values();
declare variable $speakersA := $speechA//spkr/data(@ref) => distinct-values();
declare variable $xspacer := 10;
declare variable $yspacer := 25;



<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-family="sans-serif" font-size="20px" fill="black">Character Appearances with Zuko and Aang</text>
    </g>
    <g>
    
        {
        for $sceneZ at $posZ in $speakersZ
        for $sceneA at $posA in $speakersA
        let $spkr-speech-countZ := $speechZ//Q{}scene/Q{}sp[Q{}spkr/data(@ref) = $sceneZ]/.. => count()
        let $spkr-speech-countA := $speechA//Q{}scene/Q{}sp[Q{}spkr/data(@ref) = $sceneA]/.. => count()
        where $spkr-speech-countA > 1
        where $spkr-speech-countZ > 1
        return
            <g>
            <!-- ZUKO -->
            <text x="-80" y="{$posZ * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$sceneZ}</text>
            <line x1="0" y1="{$posZ * $yspacer}" x2="{$spkr-speech-countZ * $xspacer}" y2="{$posZ * $yspacer}" stroke="red" stroke-width="15"/>
            <text x="-15" y="{$posZ * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="red">{$spkr-speech-countZ}</text>
            <line x1="0" y1="0" x2="0" y2="{max($posZ + 1) * $yspacer}" stroke="black" stroke-width="5"/>
            
            <!-- AANG -->
            <line x1="{$spkr-speech-countZ * $xspacer}" y1="{$posZ * $yspacer}" x2="{($spkr-speech-countZ * $xspacer) + ($spkr-speech-countA * $xspacer)}" y2="{$posZ * $yspacer}" stroke="blue" stroke-width="15"/>
            <text x="400" y="{$posA * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="blue">{$spkr-speech-countA}</text>
            <!--<line x1="0" y1="0" x2="0" y2="{max($posA + 1) * $yspacer}" stroke="black" stroke-width="2"/>-->
            
        </g>
        }
        </g>
        </g>
</svg>