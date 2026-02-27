<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Úkol – věk a pohlaví</title>
</head>
<body>

<h2>Zadej údaje</h2>

<form method="post">
    <label>Věk:</label><br>
    <input type="number" name="vek" required><br><br>

    <label>Pohlaví:</label><br>
    <select name="pohlavi" required>
        <option value="">-- vyber --</option>
        <option value="muž">muž</option>
        <option value="žena">žena</option>
    </select><br><br>

    <button type="submit">Odeslat</button>
</form>

<hr>

<?php
if (isset($_POST["vek"]) && isset($_POST["pohlavi"])) {

    $vek = $_POST["vek"];
    $pohlavi = $_POST["pohlavi"];

    echo "<h1>Věk: $vek, Pohlaví: $pohlavi</h1>";

    if ($vek < 18) {
        echo "<p>Přístup odmítnut. Jsi příliš mladý</p>";
    } else {
        if ($pohlavi == "muž") {
            echo "<p>Stránka pro dospělé muže</p>";
        } elseif ($pohlavi == "žena") {
            echo "<p>Stránka pro dospělé ženy</p>";
        }
    }
}
?>

</body>
</html>