<!DOCTYPE html>
<html lang="cs">

<head>
    <meta charset="UTF-8">
    <title>Opakování – PHP</title>
</head>

<body>
    <h1>Opakování – PHP</h1>
    <?php
    echo "<h2>Proměnné</h2>";

    // Proměnné
    $jmeno = "Dany";
    $vek = 18;
    $vyska = 175;

    echo "Jméno: $jmeno<br>";
    echo "Věk: $vek<br>";
    echo "Výška: $vyska cm<br>";

    $cenaBezDPH = 100;
    $cenaSDPH = $cenaBezDPH * 1.21;
    echo "Cena bez DPH: $cenaBezDPH Kč<br>";
    echo "Cena s DPH: $cenaSDPH Kč<br>";

    $cislo = 7;
    echo "Druhá mocnina čísla $cislo je " . ($cislo ** 2) . "<br>";

    echo "<h2>Operátory</h2>";

    $a = 10;
    $b = 5;

    echo "Součet: " . ($a + $b) . "<br>";
    echo "Rozdíl: " . ($a - $b) . "<br>";
    echo "Součin: " . ($a * $b) . "<br>";
    echo "Podíl: " . ($a / $b) . "<br>";

    $testCislo = 8;
    if ($testCislo % 2 == 0) {
        echo "$testCislo je sudé číslo<br>";
    } else {
        echo "$testCislo je liché číslo<br>";
    }

    if ($a > $b) {
        echo "$a je větší než $b<br>";
    } elseif ($a < $b) {
        echo "$b je větší než $a<br>";
    } else {
        echo "Čísla jsou stejná<br>";
    }

    echo "<h2>Podmínky</h2>";

    $vekUzivatele = 18;
    if ($vekUzivatele <= 15) {
        echo "Uživatel je žák ZŠ<br>";
    } elseif ($vekUzivatele <= 19) {
        echo "Uživatel je student SŠ<br>";
    } else {
        echo "Uživatel je student VŠ<br>";
    }

    $body = 75;
    if ($body >= 90) $znamka = 1;
    elseif ($body >= 75) $znamka = 2;
    elseif ($body >= 60) $znamka = 3;
    elseif ($body >= 45) $znamka = 4;
    else $znamka = 5;

    echo "Známka: $znamka<br>";

    $cislo2 = -3;
    if ($cislo2 > 0) echo "Číslo je kladné<br>";
    elseif ($cislo2 < 0) echo "Číslo je záporné<br>";
    else echo "Číslo je nula<br>";

    $spravneHeslo = "tajne123";
    $zadaneHeslo = "tajne123";
    if ($zadaneHeslo === $spravneHeslo) {
        echo "Heslo je správné<br>";
    } else {
        echo "Heslo je špatné<br>";
    }

    echo "<h2>Cykly</h2>";

    echo "Čísla 1–10:<br>";
    for ($i = 1; $i <= 10; $i++) {
        echo $i . "<br>";
    }

    echo "Sudá čísla 0–20:<br>";
    $i = 0;
    while ($i <= 20) {
        echo $i . "<br>";
        $i += 2;
    }

    $soucet = 0;
    for ($i = 1; $i <= 100; $i++) {
        $soucet += $i;
    }
    echo "Součet čísel 1–100: $soucet<br>";

    echo "Násobilka 5:<br>";
    for ($i = 1; $i <= 10; $i++) {
        echo "5 × $i = " . (5 * $i) . "<br>";
    }
    ?>
</body>

</html>