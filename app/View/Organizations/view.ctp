<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Organizations'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Organization</h2>
    <P><B>Name:</B>&nbsp;<?php echo $organization['Organization']['name']; ?></P>
    
    <P><B>Contacts:</B>&nbsp;
        <?php
            //echo print_r($organization);
            //echo "<pre>";
            //echo print_r($organization);
            //echo "</pre>";
            $c = count($organization['Contact']);
            //echo "c is".$c;
            if ($c == 0) {
                echo "None";
            } else {
                foreach ($organization['Contact'] as $contact) {
                    echo "<LI>";
                    echo $this->Html->link(__($contact['name_vf']), array(
                        'controller' => 'contacts',
                        'action' => 'view',
                        $contact['id']));
                    echo "</LI>";
                }
            }
        ?>
    </P>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

