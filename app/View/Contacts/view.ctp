<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('List Contacts'), array('action' => 'index')); ?>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Contact</h2>
    <P><B>Name:</B>&nbsp;<?php echo $contact['Contact']['name_vf']; ?></P>
    <P><B>Mobile:</B>&nbsp;<?php echo $contact['Contact']['mobile']; ?></P>
    <P><B>Skype:</B>&nbsp;<?php echo $contact['Contact']['skype']; ?></P>
    <P><B>Email:</B>&nbsp;<?php echo $contact['Contact']['email']; ?></P>
    <P><B>Contact Type:</B>&nbsp;<?php echo $contact['ContactType']['name']; ?></P>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
