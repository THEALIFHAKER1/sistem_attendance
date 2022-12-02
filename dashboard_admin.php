<?php
include_once "component/connection.php";
include_once "component/header.php";
include_once "component/nav.php";

$result = mysqli_query($mysqli, "SELECT * FROM kehadiran ORDER BY ndp DESC");
 
 if (isset($_POST['Submit'])) {
     $ndp = $_POST['ndp'];
  
     // Insert data ke database
     $add = mysqli_query($mysqli, "INSERT INTO kehadiran(ndp,waktu_kehadiran) VALUES('$ndp', NOW())");
     if ($add) {
         header("Refresh:0");
     }
 }
 ?>
 <html> 
 <body>
     <center class="underline font-bold text-xl pt-6">KEHADIRAN PELAJAR KE KELAS</center>
 <div class="overflow-hidden">
     <div class="flex flex-col pt-6 pr-12 pl-12">
     <div class="overflow-x-auto sm:-mx-8 lg:-mx-8">
         <div class="py-2 inline-block min-w-full sm:px-8 lg:px-8">
         
             <table class="min-w-full border text-center">
             <thead>
                 <tr class="border-b bg-gray-700">
                 <th scope="col" class="text-md font-medium text-white px-4 py-4 border-r">
                     Nama
                 </th>
                 <th scope="col" class="text-md font-medium text-white px-4 py-4 border-r">
                     NDP
                 </th>
                 <th scope="col" class="text-md font-medium text-white px-4 py-4 border-r">
                     Waktu Kehadiran
                 </th>
                 <th scope="col" class="text-md font-medium text-white px-4 py-4 border-r">
                     Tindakan
                 </th>
                 </tr>
                <?php
                $result = mysqli_query(
                    $mysqli,
                    "SELECT * FROM kehadiran"
                );
                
                while ($r1 = mysqli_fetch_array($result)){
                    $ndp= $r1['ndp']; 
                    $data = mysqli_query(
                        $mysqli,
                        "SELECT * FROM student WHERE ndp='$ndp'"
                    );
                    $r = mysqli_fetch_array($data)
                ?>  
                <tr>
                    <td class="border-r"><?php echo $r['nama']; ?></td>
                    <td class="border-r"><?php echo $r1['ndp']; ?></td>
                    <td class="border-r"><?php echo $r1['waktu_kehadiran']; ?></td>
                    <td>
                        <button class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-3 border border-gray-700 rounded">
                            <a href='edit.php?ndp=<?php echo $r['ndp'];?>'>Edit</a>
                        </button>
                        <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-3 border border-red-700 rounded">
                            <a href='delete.php?ndp=<?php echo $r1['ndp'];?>'>Delete</a>
                        </button>
                    </td>
                </tr>
                <?php 
                }
                ?>
             </thead>
             </table>       
         </div>
     </div>
     </div>
 </div>

 <?php
 include_once "component/footer.php";
 ?>