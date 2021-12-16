<?php
echo "enter id or average temperature : \n";
?>
<form action="search.php" method="POST">
    <input type="text" name="search" placeholder="search" >
    <button type="submit" name="submit">Go</button>
</form>
<?php
include_once("config.php");
include_once("Database.php");
$db = new Database();
$db->query("select * from temperature");


$results = $db->resultSet();

foreach ($results as $result) {
    echo "<h1>".$result->id."</h1>".$result->date."<p>"."average temperature: ".$result->AverageTemp. "\t" ."average temperature unertainity". $result->AverageTempUncertainty . "\t" .
      "\t"."</p>"."\n";
}
$db->query("insert into temperature values (null,'2014-10-1',3.1,4.6,1,1)");
$db->execute();
?>

