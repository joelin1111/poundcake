<div class="span9">
    <h2>View Graphs: <?php echo $name; ?> </h2>
    <h4>7 Day ICMP Response Time</h4>
    <img src="
        <?php
            $base64   = base64_encode( $performance_graphs[0] ); 
            echo 'data:image/png;base64,' . $base64;
        ?>"
    alt="7 Day ICMP Response Time"/>
</div>