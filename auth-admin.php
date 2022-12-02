<?php
include "component/header.php";
if ($_SESSION["access"] !== "admin") {
    header("Location: login.php");
    exit();
}
?>