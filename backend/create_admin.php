<?php
/* Create a default admin user if none exists
   Usage: visit this file in your browser once (e.g. http://localhost/mediq/backend/create_admin.php)
   Then remove or restrict access to this file for security. */
include('include/config.php');

$defaultUser = 'admin';
$defaultPass = 'admin123';

$check = mysqli_query($con, "SELECT id FROM admin WHERE username='".mysqli_real_escape_string($con, $defaultUser)."'");
if(!$check) {
    echo "Database query failed: ".mysqli_error($con);
    exit;
}

if(mysqli_num_rows($check) > 0){
    echo "Admin user already exists.\n";
} else {
    $insert = mysqli_query($con, "INSERT INTO admin (username,password) VALUES ('".mysqli_real_escape_string($con, $defaultUser)."','".mysqli_real_escape_string($con, $defaultPass)."')");
    if($insert){
        echo "Default admin created:\nUsername: $defaultUser\nPassword: $defaultPass\n";
    } else {
        echo "Failed to create admin: ".mysqli_error($con);
    }
}

?>
