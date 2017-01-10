xquery version "1.0";
declare namespace sa="http://www.poznan.pl";
declare namespace zw="http://www.mmarocks.pl";
declare option saxon:output "method=xhtml";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare option saxon:output "doctype-system=https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";

let $zawodnicy := (doc("Zadanie1.xml")/sa:SPORT_AMATORSKI/zw:ZAWODNICY/zw:ZAWODNIK)

return 
<results>
<table border="2">
<tr><th><b>IMIE</b></th><th><b>NAZWISKO</b></th><th><b>WAGA</b></th><th><b>STYL</b></th></tr>
{
   for $x in $zawodnicy   
   return <tr><td>{data($x/zw:IMIE)}</td><td>{data($x/zw:NAZWISKO)}</td><td>{data($x/zw:WAGA)}</td><td>{data($x/zw:STYL)}</td></tr>
}

</table>
</results>
