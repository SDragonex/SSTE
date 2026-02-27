<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>PHP Úkoly</title>
    <style>
        body { font-family: sans-serif; line-height: 1.6; max-width: 600px; margin: 20px auto; padding: 20px; background-color: #f4f4f4; }
        section { background: white; padding: 15px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h2 { color: #333; border-bottom: 2px solid #007bff; padding-bottom: 5px; }
        .vysledek { margin-top: 10px; padding: 10px; background: #e7f3ff; border-left: 5px solid #007bff; font-weight: bold; }
        input[type="number"], input[type="text"] { padding: 8px; width: 100px; margin-bottom: 10px; }
        input[type="submit"] { padding: 8px 15px; cursor: pointer; background: #28a745; color: white; border: none; border-radius: 4px; }
    </style>
</head>
<body>
    <section>
        <h2>1. Sudé, liché, nebo nula</h2>
        <form method="post">
            <input type="number" name="cislo1" placeholder="Zadej číslo" required>
            <input type="submit" name="ukol1" value="Zkontrolovat">
        </form>
        <?php
        if (isset($_POST['ukol1'])) {
            $cislo = $_POST['cislo1'];
            echo "<div class='vysledek'>";
            if ($cislo == 0) echo "Číslo je nula.";
            elseif ($cislo % 2 == 0) echo "Číslo $cislo je sudé.";
            else echo "Číslo $cislo je liché.";
            echo "</div>";
        }
        ?>
    </section>

    <section>
        <h2>2. Podíl dvou čísel</h2>
        <form method="post">
            <input type="number" name="delitelny" placeholder="Číslo A" required> /
            <input type="number" name="delitel" placeholder="Číslo B" required>
            <input type="submit" name="ukol2" value="Vypočítat">
        </form>
        <?php
        if (isset($_POST['ukol2'])) {
            $a = $_POST['delitelny'];
            $b = $_POST['delitel'];
            echo "<div class='vysledek'>";
            if ($b == 0) echo "Chyba: Nulou nelze dělit!";
            else echo "Podíl je: " . ($a / $b);
            echo "</div>";
        }
        ?>
    </section>

    <section>
        <h2>3. Trefa (Sudé a rovno 50)</h2>
        <form method="post">
            <input type="number" name="cislo3" placeholder="Zadej číslo" required>
            <input type="submit" name="ukol3" value="Zkusit štěstí">
        </form>
        <?php
        if (isset($_POST['ukol3'])) {
            $hodnota = $_POST['cislo3'];
            echo "<div class='vysledek'>";
            if ($hodnota % 2 == 0 && $hodnota == 50) echo "Hurá, trefil ses!";
            else echo "Prohrál jsi!";
            echo "</div>";
        }
        ?>
    </section>

    <section>
        <h2>4. Je to pes nebo kočka?</h2>
        <form method="post">
            <input type="text" name="zvire" placeholder="Napiš zvíře" required>
            <input type="submit" name="ukol4" value="Ověřit">
        </form>
        <?php
        if (isset($_POST['ukol4'])) {
            $druh = mb_strtolower($_POST['zvire']); // Převedeme na malá písmena pro snadnější kontrolu
            echo "<div class='vysledek'>";
            if ($druh == "pes" || $druh == "kočka") echo "Zadané zvíře je " . $druh;
            else echo "Zadané zvíře není pes ani kočka.";
            echo "</div>";
        }
        ?>
    </section>

    <section>
        <h2>5. Obvod a obsah obdélníka</h2>
        <form method="post">
            <input type="number" name="strana_a" placeholder="Strana a" step="any" required>
            <input type="number" name="strana_b" placeholder="Strana b" step="any" required>
            <input type="submit" name="ukol5" value="Spočítat">
        </form>
        <?php
        if (isset($_POST['ukol5'])) {
            $sa = $_POST['strana_a'];
            $sb = $_POST['strana_b'];
            echo "<div class='vysledek'>";
            if ($sa > 0 && $sb > 0) {
                echo "Obvod: " . (2 * ($sa + $sb)) . " j.<br>";
                echo "Obsah: " . ($sa * $sb) . " j²";
            } else {
                echo "Obdélník musí mít strany větší než 0!";
            }
            echo "</div>";
        }
        ?>
    </section>

</body>
</html>