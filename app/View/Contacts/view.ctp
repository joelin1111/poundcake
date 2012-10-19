<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Contacts'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Contact</h2>
    <P><B>Name:</B>&nbsp;<?php echo $contact['Contact']['name_vf']; ?></P>
    <P><B>Title:</B>&nbsp;<?php echo $contact['Contact']['title']; ?></P>
    <P><B>Number:</B>&nbsp;<?php echo $contact['Contact']['phone']; ?></P>
    <P><B>Skype:</B>&nbsp;<?php echo $contact['Contact']['skype']; ?></P>
    <P><B>Email:</B>&nbsp;<?php echo $contact['Contact']['email']; ?></P>
    <P><B>Priority:</B>&nbsp;<?php echo $contact['Contact']['priority']; ?></P>
    <P><B>Tower Owner:</B>&nbsp;<?php echo $contact['TowerOwner']['name']; ?></P>
    <P><B>Contact Type:</B>&nbsp;<?php echo $contact['ContactType']['name']; ?></P>
    
</div> <!-- /.span9 -->
</div> <!-- /.row -->
