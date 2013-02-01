<P><B>Provisioned On:</B>&nbsp;<?php echo $provisioned_on; ?></P>
<P><B>Provisioned By:</B>&nbsp;<?php echo $provisioned_by_name; ?></P>
<P><B>Foreign ID:</B>&nbsp;<?php echo $foreign_id; ?></P>
<P><B>Last Checked:</B>&nbsp;
    <?php
        $date = new DateTime( $checked );
        //echo $date->format($datetime_format);
        echo $date->format( 'g:i a \o\n l, F j, Y' );
    ?>
</P>