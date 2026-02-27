<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>PHP – Společná hodina 13.2.</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        h2 { color: darkblue; }
        .box { margin-bottom: 30px; padding: 15px; border: 1px solid #ccc; }
    </style>
</head>
<body>

<h1>PHP – Společná hodina 13.2.</h1>

<?php

echo "<div class='box'>";
echo "<h2>Příklad 1 – Převod teploty</h2>";

$celsius = 25;
$fahrenheit = ($celsius * 9/5) + 32;

echo "Teplota v °C: $celsius <br>";
echo "Teplota v °F: $fahrenheit";
echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 2 – Rozklad částky</h2>";

$castka = 587;
$bankovky = [500, 100, 50, 20, 10, 5, 2, 1];

foreach ($bankovky as $hodnota) {
    $pocet = intdiv($castka, $hodnota);
    $castka %= $hodnota;
    echo "$hodnota Kč: $pocet ks <br>";
}

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 3 – Obvod a obsah kruhu</h2>";

$polomer = 5;
$obvod = 2 * pi() * $polomer;
$obsah = pi() * pow($polomer, 2);

echo "Poloměr: $polomer <br>";
echo "Obvod: $obvod <br>";
echo "Obsah: $obsah";

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 4 – Přijímačky</h2>";

$matematika = 65;
$cestina = 55;
$prumer = ($matematika + $cestina) / 2;

if ($matematika >= 50 && $cestina >= 50 && $prumer >= 60) {
    echo "Student byl přijat.";
} else {
    echo "Student nebyl přijat.";
}

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 5 – Přestupný rok</h2>";

$rok = 2024;

if (($rok % 4 == 0 && $rok % 100 != 0) || ($rok % 400 == 0)) {
    echo "$rok je přestupný rok.";
} else {
    echo "$rok není přestupný rok.";
}

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 6 – Slevový systém</h2>";

$cena = 3500;

if ($cena > 5000) {
    $cena *= 0.8;
} elseif ($cena > 2000) {
    $cena *= 0.9;
}

echo "Konečná cena: $cena Kč";

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 7 – Faktoriál</h2>";

$cislo = 6;
$faktorial = 1;

for ($i = 1; $i <= $cislo; $i++) {
    $faktorial *= $i;
}

echo "Faktoriál čísla $cislo je $faktorial";

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 8 – Součet lichých čísel</h2>";

$soucet = 0;

for ($i = 1; $i <= 100; $i++) {
    if ($i % 2 != 0) {
        $soucet += $i;
    }
}

echo "Součet lichých čísel od 1 do 100 je $soucet";

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 9 – Hvězdičkový vzor</h2>";

for ($i = 1; $i <= 5; $i++) {
    for ($j = 1; $j <= $i; $j++) {
        echo "*";
    }
    echo "<br>";
}

echo "</div>";

echo "<div class='box'>";
echo "<h2>Příklad 10 – Obrácené číslo</h2>";

$cislo = 12345;
$obratene = strrev($cislo);

echo "Původní číslo: $cislo <br>";
echo "Obrácené číslo: $obratene";

echo "</div>";

?>

</body>
</html>
