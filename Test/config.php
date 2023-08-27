<?php
$host = "localhost";
$port = "5432"; // Default PostgreSQL port
$dbname = "postgres";
$user = "postgres";
$password = "1234";

$connection_string = "host={$host} port={$port} dbname={$dbname} user={$user} password={$password} options='--client_encoding=UTF8'";

$dbconn = pg_connect($connection_string) or die("Could not connect: " . pg_last_error());

function getSkills() {
    global $dbconn;
    $query = "SELECT name FROM skill";
    $result = pg_query($query) or die('Query failed: ' . pg_last_error());
    $skills = [];
    while ($row = pg_fetch_assoc($result)) {
        $skills[] = $row['name'];
    }
    pg_free_result($result);
    return $skills;
}
?>
