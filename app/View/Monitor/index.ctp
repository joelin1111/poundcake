<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li>Lorem Ipsum</li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">    
	<h2>Interface Status</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th align="center">OpenNMS Node</th>
                    <th align="center">Interfaces</th>
                </tr>
            </thead>
            <tbody>
            <?php
            foreach ($nodes_ids as $n): ?>
            <tr>
                <td><?php echo $n['node'];?></td>
                <?
                echo '<td>';
                foreach ($n['interfaces'] as $k => $v )  {
                    foreach ($v as $ip => $status) {
                        $class = 'label label-success'; // defal
                        if ($status === "true")
                            $class = 'label label-important';                            
                        echo $this->Html->tag('span', $ip, array('class' => $class));
                        echo '&nbsp;';
                    }
                }
                echo '</td>';
                ?>
            </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
</div> <!-- /.span9 -->
</div> <!-- /.row -->