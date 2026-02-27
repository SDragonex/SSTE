<!DOCTYPE html>
<html lang="cs">

<head>
    <meta charset="UTF-8">
    <title>PHP Funkce</title>
</head>

<body>

    <h1>PHP Funkce</h1>

    <?php

    function zeStupnuNaKelviny($celsia)
    {
        return $celsia + 273.15;
    }

    function zKelvinuNaStupne($kelviny)
    {
        return $kelviny - 273.15;
    }

    function vratPocetZnaku($text)
    {
        return strlen($text);
    }

    function vratPocetSlov($text)
    {
        return str_word_count($text);
    }

    function jePravouhly($a, $b, $c)
    {
        if (
            $a * $a + $b * $b == $c * $c ||
            $a * $a + $c * $c == $b * $b ||
            $b * $b + $c * $c == $a * $a
        ) {
            return true;
        }
        return false;
    }

    function vratObsah($a, $b, $c)
    {
        if ($a + $b > $c && $a + $c > $b && $b + $c > $a) {
            $s = ($a + $b + $c) / 2;
            return sqrt($s * ($s - $a) * ($s - $b) * ($s - $c));
        }
        return false;
    }

    function secti($a, $b)
    {
        return $a + $b;
    }

    function jeSude($cislo)
    {
        return $cislo % 2 == 0;
    }

    function vratNejvetsi($a, $b, $c)
    {
        $nejvetsi = $a;
        if ($b > $nejvetsi) {
            $nejvetsi = $b;
        }
        if ($c > $nejvetsi) {
            $nejvetsi = $c;
        }
        return $nejvetsi;
    }

    function faktorial($n)
    {
        if ($n < 0) {
            return false;
        }
        if ($n == 0 || $n == 1) {
            return 1;
        }
        $vysledek = 1;
        for ($i = 2; $i <= $n; $i++) {
            $vysledek *= $i;
        }
        return $vysledek;
    }



    echo "<h2>Testování funkcí</h2>";

    echo "25 °C na Kelviny: " . zeStupnuNaKelviny(25) . "<br>";
    echo "300 K na °C: " . zKelvinuNaStupne(300) . "<br><br>";

    $text = "Toto je ukázkový text pro testování funkcí.";
    echo "Počet znaků: " . vratPocetZnaku($text) . "<br>";
    echo "Počet slov: " . vratPocetSlov($text) . "<br><br>";

    echo "Je trojúhelník (3,4,5) pravoúhlý? ";
    echo jePravouhly(3, 4, 5) ? "ANO" : "NE";
    echo "<br><br>";

    echo "Obsah trojúhelníka (3,4,5): " . vratObsah(3, 4, 5) . "<br><br>";

    echo "Součet 10 + 5: " . secti(10, 5) . "<br>";

    echo "Je číslo 8 sudé? ";
    echo jeSude(8) ? "ANO" : "NE";
    echo "<br><br>";

    echo "Největší z čísel (5, 12, 9): " . vratNejvetsi(5, 12, 9) . "<br><br>";

    echo "Faktoriál 5: " . faktorial(5) . "<br>";

    ?>

</body>

</html>