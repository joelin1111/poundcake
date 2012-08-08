<?php echo $javascript->link('jquery.paginate_form'); ?>
<script type="text/javascript">
$(function() {
    paginator('<?php echo $this->base . '/<controller>/<action>'?>', 'SearchIndexForm', 'indexAjax');

});
</script>

<div class="header">
        <h2>Carrocerías</h2>
    </div>
    <div id="hideableSearch">
        <div id="showSearchImages">
<?php
echo $html->image('Search-index.png', array('style'=>'height: 35px;'));
?>
        </div>
        <div id="searchFormDiv">
            <fieldset class="fieldset-search-index">
<?php
echo $form->create('Search', array('id'=>'SearchIndexForm', 'encoding'=>'UTF-8'));
echo $form->input('nombre', array('type'=>'text', 'size'=>10));
echo $form->input('codigo', array('type'=>'text', 'size'=>10));
echo $form->input('descripcion', array('type'=>'text', 'size'=>20));
echo $form->end();
?>
            </fieldset>
        </div>
    </div>
<div id="indexAjax">
<table cellpadding="0" cellspacing="0">
    <tr>
        <th>#</th>
        <th><?php echo $this->Paginator->sort('Nombre','nombre', array('url'=>$url));?></th>
        <th><?php echo $this->Paginator->sort('Codigo','codigo', array('url'=>$url));?></th>
        <th><?php echo $this->Paginator->sort('Descripcion','descripcion', array('url'=>$url));?></th>
        <th class="actions">Acciones</th>
    </tr>
<?php
$i = 0;
foreach ($carrocerias as $item):
    $class = null;
    if ($i++ % 2 == 0) $class = ' class="altrow"';
?>
    <tr<?php echo $class; ?> id="<?php echo $item['Carroceria']['id']?>">
        <td><?php echo $i; ?>&nbsp;</td>
        <td><?php echo $item['Carroceria']['nombre']; ?>&nbsp;</td>
        <td><?php echo $item['Carroceria']['codigo']; ?>&nbsp;</td>
        <td><?php echo $item['Carroceria']['descripcion']; ?>&nbsp;</td>
        <td class="actions">
            <?php echo $this->Html->link($html->image('Edit.png'), array('action' => 'edit', $item['Carroceria']['id']), array('escape'=>false, 'class'=>'index-actions')); ?>
        </td>
    </tr>
<?php endforeach; ?>
</table>
<p>
<?php
echo $this->Paginator->counter(array(
'format' => 'Pag %page% de %pages%, %current% registros de %count% en total, desde %start% hasta %end%'
));
?></p>
<div class="paging">
<?php
$paginator->options(array('url'=> $url));
echo $this->Paginator->prev('<< '.'Prev', array(), null, array('class'=>'disabled')).' | ';
echo $this->Paginator->numbers() .' | ';
echo $this->Paginator->next('Sig'.' >>', array(), null, array('class' => 'disabled'));
?></div>
</div>