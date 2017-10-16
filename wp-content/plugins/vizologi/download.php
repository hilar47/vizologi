<?php
if($_GET['ext'] == 'png') {
    $ext = 'png';
} elseif($_GET['ext'] == 'jpg') {
    $ext = 'jpg';
}

header('Content-disposition: attachment; filename=' . $_GET['name']);
header('Content-type: image/'.$ext);
readfile($_GET['downloadurl']);
?>