<?php

echo "<h3>1. Dny v týdnu</h3>";
$den = 3;

switch ($den) {
    case 1: echo "Pondělí"; break;
    case 2: echo "Úterý"; break;
    case 3: echo "Středa"; break;
    case 4: echo "Čtvrtek"; break;
    case 5: echo "Pátek"; break;
    case 6: echo "Sobota"; break;
    case 7: echo "Neděle"; break;
    default: echo "Neplatný den";
}


echo "<h3>2. Slušný pozdrav</h3>";
$jmeno = "Jan";
$pohlavi = "muz";

if ($pohlavi === "muz")
{
    echo "Vítáme vás, pane $jmeno";
}
elseif ($pohlavi === "zena")
{
    echo "Vítáme vás, paní $jmeno";
}
else
{
    echo "Neznámé pohlaví";
}


echo "<h3>3. Hledání v textu</h3>";
$veta = "Učíme se programovat v PHP.";

if (str_contains($veta, "PHP"))
{
    echo "Nalezeno";
}
else
{
    echo "Nenalezeno";
}


echo "<h3>4. Seznam nákupu</h3>";
$nakup = ["Chleba", "Mléko", "Vejce"];

$i = 1;
foreach ($nakup as $polozka)
{
    echo "$i. $polozka<br>";
    $i++;
}


echo "<h3>5. Výpočet ceny s DPH</h3>";
$cena = 100;

function vypoctiDPH($castka)
{
    return $castka * 1.21;
}

echo "Cena s DPH: " . vypoctiDPH($cena) . " Kč";



echo "<h3>6. Stav odevzdání úkolu</h3>";
$odevzdano = true;

if ($odevzdano)
{
    echo "Úkol byl odevzdán";
}
else
{
    echo "Úkol nebyl odevzdán";
}

?>