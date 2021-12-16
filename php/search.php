<?php
include_once("config.php");
include_once("Database.php");
$db = new Database();

?>

<h1>result page</h1>
<div>
<?php
if(isset($_POST['submit'])){
  $x= $_POST['search'];
  $db->query("SELECT * FROM temperature where 
  id LIKE '%$x%' OR AverageTemp LIKE '%$x%'
  ");
 $result = $db->single();
 echo $result->id . "\t" . $result->date . "\t" .
    $result->AverageTemp . "\t" . $result->AverageTempUncertainty ."\t" . $result->AverageTempUncertainty."\t" ."\n";
}
?>
</div>