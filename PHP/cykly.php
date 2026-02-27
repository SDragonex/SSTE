<!DOCTYPE html>
<html lang="cs">

<head>
    <meta charset="UTF-8">
    <title>Cykly – příklady</title>
</head>

<body>

    <h1>Cykly – příklady</h1>

    <h2>1) Faktoriál čísla (1–10)</h2>

    <form method="post">
        <label>Zadej číslo (1–10):</label><br>
        <input type="number" name="cislo" min="1" max="10">
        <button type="submit">Spočítat faktoriál</button>
    </form>

    <hr>

    <h2>2) Dělitelná čísla</h2>

    <form method="post">
        <label>Zadej n:</label><br>
        <input type="number" name="n"><br><br>

        <label>Zadej dělitele d:</label><br>
        <input type="number" name="d"><br><br>

        <button type="submit">Vypsat čísla</button>
    </form>

    <hr>

    <?php
    if (isset($_POST["cislo"]) && $_POST["cislo"] != "") {

        $n = $_POST["cislo"];

        // FOR
        $faktorial_for = 1;
        for ($i = 1; $i <= $n; $i++) {
            $faktorial_for *= $i;
        }

        // WHILE
        $faktorial_while = 1;
        $i = 1;
        while ($i <= $n) {
            $faktorial_while *= $i;
            $i++;
        }

        echo "<h3>Výsledek – faktoriál</h3>";
        echo "<p>Číslo: <strong>$n</strong></p>";
        echo "<p>Faktoriál (for): <strong>$faktorial_for</strong></p>";
        echo "<p>Faktoriál (while): <strong>$faktorial_while</strong></p>";
    }

    if (isset($_POST["n"]) && isset($_POST["d"]) && $_POST["n"] != "" && $_POST["d"] != "") {

        $n = $_POST["n"];
        $d = $_POST["d"];

        echo "<h3>Dělitelná čísla v intervalu &lt;0; $n&gt;</h3>";

        // FOR
        echo "<p><strong>FOR cyklus:</strong> ";
        $nalezeno = false;

        for ($i = $n; $i >= 0; $i--) {
            if ($i % $d == 0) {
                echo "$i ";
                $nalezeno = true;
            }
        }

        if (!$nalezeno) {
            echo "Žádné číslo neexistuje.";
        }
        echo "</p>";

        // WHILE
        echo "<p><strong>WHILE cyklus:</strong> ";
        $nalezeno = false;
        $i = $n;

        while ($i >= 0) {
            if ($i % $d == 0) {
                echo "$i ";
                $nalezeno = true;
            }
            $i--;
        }

        if (!$nalezeno) {
            echo "Žádné číslo neexistuje.";
        }
        echo "</p>";
    }
    ?>

</body>

</html>