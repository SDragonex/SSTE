<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>PHP úlohy</title>
</head>
    <body>

        <h2>1. Pozdrav podle času</h2>
        <?php
        $hodina = 14;
        if ($hodina < 12)
        {
            echo "Dobré ráno<br>";
        }
        elseif ($hodina < 18)
        {
            echo "Dobrý den<br>";
        }
            else
            {
                echo "Dobrý večer<br>";
            }
        ?>

        <h2>2. Jednoduchá kalkulačka</h2>
        <?php
        $a = 10; $b = 5; $op = "*";
        switch ($op)
        {
            case '+': echo $a + $b; break;
            case '-': echo $a - $b; break;
            case '*': echo $a * $b; break;
            case '/': echo $a / $b; break;
            default: echo "Neznámá operace";
        }
        ?>

        <h2>3. Sudá čísla</h2>
        <?php
        for ($i = 0; $i <= 20; $i += 2)
        {
            echo $i . " ";
        }
        ?>

        <h2>4. Hledání v poli</h2>
        <?php
        $jmena = ["Anna", "Petr", "Jana"];
        if (in_array("Petr", $jmena))
        {
            echo "Petr je v seznamu";
        }
        ?>

        <h2>5. Násobilka</h2>
        <?php
        for ($i = 1; $i <= 5; $i++)
        {
            for ($j = 1; $j <= 5; $j++)
            {
                echo ($i * $j) . " ";
            }
            echo "<br>";
        }
        ?>

        <h2>6. Obrácení řetězce</h2>
        <?php
        $text = "Ahoj";
        $obracene = "";
        for ($i = strlen($text) - 1; $i >= 0; $i--)
        {
            $obracene .= $text[$i];
        }
        echo $obracene;
        ?>

        <h2>7. Asociativní pole</h2>
        <?php
        $osoba = ["jmeno" => "Karel", "vek" => 30, "mesto" => "Brno"];
        echo "{$osoba['jmeno']} bydlí v městě {$osoba['mesto']} a je mu {$osoba['vek']} let.";
        ?>

        <h2>8. Převodník teploty</h2>
        <?php
        function celsToFahr($c)
        {
            return $c * 1.8 + 32;
        }
        echo "20°C = " . celsToFahr(20) . "°F";
        ?>

        <h2>9. Filtrování pole</h2>
        <?php
        $c = [5, 12, 8, 20, 3];
        $vetsi = [];
        foreach ($c as $cislo)
        {
            if ($cislo > 10)
            {
                $vetsi[] = $cislo;
            }
        }
        echo implode(", ", $vetsi);
        ?>

        <h2>10. Generátor hesla</h2>
        <?php
        $znaky = "abcdef123456";
        $heslo = "";
        for ($i = 0; $i < 8; $i++)
        {
            $heslo .= $znaky[rand(0, strlen($znaky) - 1)];
        }
        echo $heslo;
        ?>

    </body>
</html>