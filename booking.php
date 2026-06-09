<?php
$conn = mysqli_connect("localhost","root","","sgr");

$booking_reference = $_POST['booking_reference'];

$sql = "SELECT * FROM tickets
        WHERE booking_reference='$booking_reference'";

$result = mysqli_query($conn,$sql);

if(mysqli_num_rows($result) > 0){
    $row = mysqli_fetch_assoc($result);

    echo "<h2>Ticket Details</h2>";
    echo "Passenger: ".$row['passenger_name']."<br>";
    
    echo "passanger type: ".$row['passanger_type']."<br>";
    echo "Seat Number: ".$row['seat_number']."<br>";
} else {
    echo "Ticket not found";
}
?>