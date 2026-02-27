<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Úkoly</title>
</head>
<body>
    <h1>Chaker Dany</h1>
    <?php
        $pozdrav = "Ahoj světe!";
        echo $pozdrav;
        
    ?>
    <br>
    Letošní rok je <?php echo date("Y");?>
    <br>
    <?php
        $a = 5;
        $b = 10;
        $suma = $a + $b;
        echo "Součet $a a $b je: $suma";
    ?>
    <br>
    <?php
        $jmeno = "Dany";
        $vek = 18;
        echo "Jmenuji se $jmeno a je mi $vek let.";
    ?>
    <br>
    <?php
        $jmeno = "Dany";
        $prijmeni = "Chaker";
        $celeJmeno = $jmeno . " " . $prijmeni;
        echo $celeJmeno;
    ?>
    <br>
    <?php
        $polomer = 5;
        $obvod = 2 * pi() * $polomer;
        echo "Obvod kruhu s poloměrem $polomer je: " . round($obvod, 2);
    ?>
    <br>
    <?php
        $obsah = pi() * pow($polomer, 2);
        echo "Obsah kruhu s poloměrem $polomer je: " . round($obsah, 2);
    ?>
    <br>
    <?php
        $cislo1 = 15;
        $cislo2 = 25;
        $soucet = $cislo1 + $cislo2;
        echo "Součet $cislo1 a $cislo2 je: $soucet";
    ?>
    <br>
    <?php
        $rozdil = $cislo1 - $cislo2;
        echo "Rozdíl $cislo1 a $cislo2 je: $rozdil";
    ?>
    <br>
    <?php
        if ($cislo2 != 0) {
            $podil = $cislo1 / $cislo2;
            echo "Podíl $cislo1 a $cislo2 je: " . round($podil, 2);
        } else {
            echo "Nelze dělit nulou.";
        }
    ?>
    <br>
    Zbytek po dělení je: 
    <?php

        echo $cislo1 % $cislo2;
    ?>

</body>
</html>