<?php
    echo $this->Html->script('jquery-1.7.2');
    echo $this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    echo $this->Html->script('gears_init');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('Edit TCs/TRCs'), array('action' => 'edit',$trc['Trc']['id'] )); ?></li>
    </ul>
    <?php echo $this->element('Common/legend'); ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2><?php echo $trc['Trc']['trc_code'] . " " . $trc['Trc']['trc_name']; ?></h2>
    <P><B>GPS Coordinates:</B>&nbsp;<?php echo sprintf("%01.5f",$lat) . ' ' . sprintf("%01.5f",$lon) . '<br>'; ?> </P>
    <P><B>Install Date:</B>&nbsp;<?php echo $trc['Trc']['install_date']; ?></P>
    <P><B>Connectivity Type:</B>&nbsp;<?php echo $trc['ConnectivityType']['name']; ?></P>
    <P><B>Intervention Type:</B>&nbsp;<?php echo $trc['InterventionType']['name']; ?></P>
    <P><B>Site State:</B>&nbsp;<?php echo $trc['SiteState']['name']; ?></P>
    <P><B>Service Provider:</B>&nbsp;<?php echo $trc['ServiceProvider']['name']; ?></P>
    <P><B>Power Type:</B>&nbsp;<?php echo $trc['PowerType']['name']; ?></P>
    <P><B>Road Condition:</B>&nbsp;<?php echo $trc['RoadType']['name']; ?></P>
    
    <P><B>Map:</B></P>
    <?php
        $windowText = $trc['Trc']['trc_vf'];
        // draw the main map
        // lat lon already set (hopefull1y)
        echo $this->element('Common/map',
                array(
                    'windowText' => $windowText,
                    'lat' => $lat,
                    'lon' => $lon,
                    'icon' => '/img/trc.png'
                    )
                );
    ?>
    
    <P><B>Access Instructions:</B>&nbsp;
    <?php
        if ($trc['Trc']['access_instruction'] != "") {
            echo $trc['Trc']['access_instruction'];
        } else {
            echo "None";
        }
    ?>
    </P>

    <P><B>Files:</B>&nbsp;
        <?php
            // get any attached files
            $results = $this->Upload->listing('Trc', $trc['Trc']['id']);
            // echo print_r($results['files']);
            // maybe test if the file exists here?
            if ($results['files'] != null) {
                // list any uploaded files
                echo $this->Upload->view('Trc', $trc['Trc']['id']);
            } else {
                echo "None";
            }

            /* in case we want to do something more interesting with the list of files?
            $results = $this->Upload->listing('School', $school['School']['id']);
            $directory = $results['directory'];
            $baseUrl = $results['baseUrl'];
            $files = $results['files'];
            echo "<pre>".print_r($results)."</pre>";
            */
        ?>
    </P>
    
    <P><B>Contacts</B></P>
    <UL>
    <?php
        //echo "<pre>".print_r($trc['Contacts'])."</pre>";
        //echo "<pre> Count: ".count($trc['Contacts'])."</pre>";
        echo "<LI>";
        $c = count($trc['Contacts']);
        if ($c == 0) {
            echo "None";
        } else {
            foreach ($trc['Contacts'] as $contact) { 
                echo $contact['first_name']." ".$contact['last_name'];
            }
        }
        echo "</LI>";
    ?>
    </UL>

    <P><B>Schools</B></P>
    <UL>
        <?php
        //echo "<pre>".print_r($trc['Schools'])."</pre>";
        //echo "<pre> Count: ".count($trc['Contacts'])."</pre>";

        $c = count($trc['Schools']);
        if ($c == 0) {
            echo "<LI>None</LI>";
        } else {
            foreach ($trc['Schools'] as $school) {
                echo "<LI>";
                echo $this->Html->link(__($school['school_name']), array(
                    'controller' => 'schools',
                    'action' => 'view',
                    $school['id']));
                echo "</LI>";
            }
        }
        ?>
    </UL>
</div> <!-- /.span9 -->
</div> <!-- /.row -->