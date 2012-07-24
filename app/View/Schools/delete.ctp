<?php
    App::uses('File', 'Utility');
    $results = $this->Upload->listing('School', $school['School']['id']);
    // echo "<pre>".print_r($results)."</pre>";
    for($i = 0; $i < count($results['files']); ++$i) {
        echo ">> " . $results['files'][$i]; // this is the absolute path
        $file = new File($results['files'][$i], false, 0777);
        if($file->delete()) {
            // echo 'file deleted.....';
        }
    }
    rmdir($results['directory']); // remove the directory (won't work if there are files in it)
?>