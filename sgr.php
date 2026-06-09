<?php
$servername  = 'localhost';
$username = 'root';         
$password   = ''; 
$dbname = 'sgr'; 

$conn = mysqli_connect($servername, $username, $password, $dbname);
if(!$conn){
    die("connection failed:" .
    mysqli_connect_error());
}

if(isset($_POST['save'])){
  $full_name=$_POST['full_name'];
  $email=$_POST['email'];
  $phone=$_POST['phone'];


$sql = "INSERT INTO passengers (full_name, email, phone) VALUES
  ('$full_name', '$email', '$phone')";
  
  if (mysqli_query($conn, $sql)){
    echo "new record created successful";
  }else{
    echo "error: " . $sql ."<br>" .mysqli_error($conn);
  }
  mysqli_close($conn);
}

?>