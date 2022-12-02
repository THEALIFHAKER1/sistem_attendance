<?php
if (isset($_POST['ndp'])) {
    $ndp = $_POST['ndp'];
    $password = $_POST['password'];
 
    $sql = mysqli_query($mysqli, "SELECT * FROM student WHERE ndp='$ndp' AND password='$password'");
    $count = mysqli_num_rows($sql);
    if (mysqli_num_rows($sql) == 0) {
    } else {
        $row = mysqli_fetch_assoc($sql);
        $_SESSION["nama"] = $row["nama"];
        $_SESSION["ndp"] = $row["ndp"];
        $_SESSION["no_tel"] = $row["no_tel"];
        $_SESSION["id_history"] = $row["id_history"];

        if ($row["ndp"] == "Tahniah Anda telah HADIR Ke Kelas") {
            header("Location: dashboard_student.php");
        } elseif($row["ndp"] == "Anda TIDAK HADIR Ke Kelas") {
            header("Anda Tidak Berjaya Hadir ke Kelas!");
        }
    }
}
?>