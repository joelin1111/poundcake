<?php

// this version seems to have issues with the Prev/Next buttons on the last page
// only

?>
<div class="pagination pagination-centered">
    <ul>
        <LI>
        <?php
            // Shows the next and previous links
        
            echo $this->Paginator->next('<< Previous', array('tag'=>'li'), null, array('class' => 'disabled','tag'=>'li'));
            //echo $this->Paginator->prev('<< Previous', array('tag' => 'li'), array('class' => 'disabled'));
             // Shows the page numbers
            // 'tag' => 'li'
            // currentClass
            // http://stackoverflow.com/questions/989959/styling-pagination-cakephp
            // http://www.startutorial.com/articles/view/9
            //echo $this->Paginator->numbers(array('separator' => '','tag'=>'li'));
            
            // bootstrap - https://groups.google.com/forum/#!topic/cake-php/K_bXXQvtxaM[1-25]
            echo $this->Paginator->numbers(array('separator' => '','tag'=>'li','currentClass' => 'active'));
            //echo $this->Paginator->numbers(array('separator' => ''));
            
            echo $this->Paginator->next('Next >>', array('tag'=>'li'), null, array('class' => 'disabled','tag'=>'li'));
            // prints X of Y, where X is current page and Y is number of pages            
        ?>
        </LI>
    </ul>
    <BR><BR>
    <?php
        echo $this->Paginator->counter(array(
            'format' => 'Page {:page} of {:pages}<BR>{:count} records total'
        ));
        ?>
</div><!-- /.pagination .pagination-centered -->
