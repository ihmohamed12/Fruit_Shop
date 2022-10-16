<?php
    $servername = "mysql8002.site4now.net/";
    $user = "a8913b_flutter";
    $pw = "01015050489m";
    $db = "db_a8913b_flutter";
    $table = "user";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

  
    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT First_Name, Last_Name, User_LoginName, User_LoginPassword FROM $table";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            echo json_encode($dbdata);
        } else {
            echo "error";
        }
        $conn->close();
        return;
    

    if('ADD_EMP' == $action){
        $First_Name = $_POST['First_Name'];
        $Last_Name = $_POST['Last_Name'];
        $User_Phone = $_POST['User_Phone'];
        $User_Address = $_POST['User_Address'];
        $User_LoginName = $_POST['User_LoginName'];
        $User_LoginPassword = $_POST['User_LoginPassword'];
        $sql = "INSERT INTO $table (first_name, last_name,User_LoginName,User_LoginPassword,User_Phone,User_Address) VALUES('$first_name', '$last_name','$User_LoginName','$User_LoginPassword','$User_Phone','$User_Address')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_EMP' == $action){
        $emp_id = $_POST['emp_id'];
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $sql = "UPDATE $table SET first_name = '$first_name', last_name = '$last_name' WHERE id = $emp_id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_EMP' == $action){
        $emp_id = $_POST['emp_id'];
        $sql = "DELETE FROM $table WHERE id = $emp_id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }
    
?>

