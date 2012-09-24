        
<P><B>Addrpool Data:</B>&nbsp;
    <?php
//        echo "<pre>";
//        print_r($ip_addresses);
//        echo "</pre>";

        if (!isset($ip_addresses[0])) {
            echo "None";
        } else {
            $c = count($ip_addresses[0]);
            echo "<UL>";
            foreach ($ip_addresses as $subnet) {
                //echo $this->Html->link(__($contact['first_name']." ".$contact['last_name']), array(
                echo "<LI>";
                echo $subnet['addrpool_subnet']['base'];
                echo "</LI>";
            }
            echo "</UL>";
        }
    ?>
</P>