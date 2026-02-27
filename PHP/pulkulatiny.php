<!DOCTYPE html>
<html lang="cs">

<head>
    <meta charset="UTF-8">
    <title>Půlkulatiny</title>
</head>

<body>

    <h2>Výpočet půlkulatin</h2>

    <form method="post">
        <label>Rok narození:</label><br>
        <input type="number" name="rok" required><br><br>
        <button type="submit">Vypočítat</button>
    </form>

    <hr>

    <?php
    if (isset($_POST["rok"])) {

        $rok_narozeni = $_POST["rok"];
        $aktualni_rok = date("Y");
        $vek = $aktualni_rok - $rok_narozeni;

        // další půlkulatiny (nejbližší vyšší násobek 10 + 5)
        $dalsi_pul = (floor($vek / 10) * 10) + 5;

        if ($dalsi_pul <= $vek) {
            $dalsi_pul += 10;
        }

        $zbyva_let = $dalsi_pul - $vek;

        echo "<p>Je ti <strong>$vek</strong> let.</p>";
        echo "<p>Do dalších půlkulatin (<strong>$dalsi_pul</strong> let) zbývá <strong>$zbyva_let</strong> let.</p>";
    }
    ?>

</body>

</html>