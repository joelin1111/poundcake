<?php
    header("Content-disposition: attachment; filename=area.kml");
    header("Content-Type: application/vnd.google-earth.kml+xml kml; charset=utf8");
    header("Content-Transfer-Encoding: binary");
    header("Pragma: no-cache");
    header("Expires: 0");
    echo '<?xml version="1.0" encoding="UTF-8"?>';
?><kml xmlns="http://earth.google.com/kml/2.2">
    <Document>
    	<?php echo $content_for_layout ?>
    </Document>
</kml>
FOO