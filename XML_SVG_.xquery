declare namespace sa="http://www.poznan.pl";
declare namespace zw="http://www.mmarocks.pl";
declare variable $local:max-graph-height := 400; (: pixels :)
declare variable $local:graph-bar-width := 120; (: pixels :)
declare variable $local:graph-bar-spacing := 10; (: pixels :)
declare variable $local:graph-text-below := 20; (: pixels :)

let $wagi_zawodnikow := (doc("Zadanie1.xml")/sa:SPORT_AMATORSKI/zw:ZAWODNICY/zw:ZAWODNIK/zw:WAGA)
let $max_wagi_zawodnkow := max($wagi_zawodnikow)

return
    <svg xmlns="http://www.w3.org/2000/svg" 
        xmlns:xlink="http://www.w3.org/1999/xlink" 
        id="graph"
        height="{ $local:max-graph-height + ($local:graph-text-below * 2) }" 
        width="{ ($local:graph-bar-width + $local:graph-bar-spacing) * count($wagi_zawodnikow) }">
        
        <linearGradient x1="0%" x2="0%" y1="10%" y2="100%" id="gradient">
            <stop style="stop-color:#F80000" offset="0"></stop>
            <stop style="stop-color:#0000FF" offset="1"></stop>
        </linearGradient>

        {
        for $waga at $i in $wagi_zawodnikow
        let $height := (xs:float($waga) div $max_wagi_zawodnkow) * $local:max-graph-height
        let $x := ($i - 1) * ($local:graph-bar-width + $local:graph-bar-spacing)
        let $y := $local:max-graph-height - $height
        return
            (
            <rect width="{$local:graph-bar-width}" 
                height="{$height}" x="{$x}" y="{$y}" 
                fill="url(#gradient)"></rect>,
            <text x="{$x}" 
                y="{$local:max-graph-height + $local:graph-text-below}" 
                fill="red">{$waga/text()}</text>
            )
        }
    </svg>
    