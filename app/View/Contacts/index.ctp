<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('New Contact'), array('action' => 'add')); ?></li>
    </ul>
    <H3>Search</H3>
    <?php
      echo $this->Form->create(
          'Contact',
          // calls the search function on the SchoolsController
          array('action'=>'search','class' => 'well')
      );
      echo $this->Form->input('first_name',array('escape' => true,'class' => 'span2'));
      echo $this->Form->input('last_name',array('class' => 'span2'));
      ?>
    <span class="help-block">Use * as a wildcard</span>
    <?php
        echo $this->Form->submit(__('Search', true), array('div' => false));
        echo $this->Form->end(); 
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Contacts</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('first_name'); ?></th>
                    <th><?php echo $this->Paginator->sort('last_name'); ?></th>
                    <th><?php echo $this->Paginator->sort('mobile'); ?></th>
                    <th><?php echo $this->Paginator->sort('skype'); ?></th>
                    <th><?php echo $this->Paginator->sort('email'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($contacts as $contact): ?>
	<tr>
            <td><?php echo h($contact['Contact']['first_name']);?></td>
            <td><?php echo h($contact['Contact']['last_name']);?></td>
            <td><?php echo h($contact['Contact']['mobile']);?></td>
            <td><?php echo h($contact['Contact']['skype']);?></td>
            <td><?php echo h($contact['Contact']['email']);?></td>
            <td>
            <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $contact['Contact']['id'])); ?>
            <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $contact['Contact']['id']), null, __('Are you sure you want to delete contact %s?', $contact['Contact']['first_name'])); ?>
            </td>
	</tr>
        <?php endforeach; ?>
            </tbody>
        </table>

	
	<?php
            // include pagination
            echo $this->element('Common/pagination');
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->