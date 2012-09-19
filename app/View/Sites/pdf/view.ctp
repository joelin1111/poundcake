<head>
<style type="text/css">
    hr {color:sienna;}
    h1 { font-family:"Arial Black", Gadget, sans-serif; }
    h2 { font-family:"Arial Black", Gadget, sans-serif; }
    h3 { font-family:"Arial Black", Gadget, sans-serif; }
    
    ul li {
        margin-left:20px;
        font-family:"Courier New", Courier, monospace
    }
</style>
</head>
    
<?php
    // https://groups.google.com/forum/?fromgroups=#!topic/dompdf/oZ3lNpYG2hs
    //echo $this->Html->image("inveneo.gif");
?>

<h1>
<?php echo $site['Site']['site_vf']; ?>
</h1>
<hr>

<h3>
RADIOS
</h3>
<?php
    //print_r($radio_counts);
    echo '<UL>';
    foreach ($radio_counts as $key => $value) {
        echo '<LI>';
        //echo $key . " - " . print_r($value);
        echo '('.$radio_counts[$key][0]['count'].')  ';
        echo $radio_counts[$key]['radio_types']['name'];
        //echo $radios[$key]['radio_types'][0]['count'];
        echo '</LI>';
    }
    echo '</UL>';
?>

<h3>
ANTENNAS
</h3>
<?php
    //print_r($radio_counts);
    echo '<UL>';
    foreach ($antenna_counts as $key => $value) {
        echo '<LI>';
        //echo $key . " - " . print_r($value);
        echo '('.$antenna_counts[$key][0]['count'].')  ';
        echo $antenna_counts[$key]['antenna_types']['name'];
        //echo $radios[$key]['radio_types'][0]['count'];
        echo '</LI>';
    }
    echo '</UL>';
?>

<h3>
OTHER
</h3>
<?php
    //print_r($builditems);
    echo '<UL>';
    foreach ($builditems as $key => $value) {
        echo '<LI>';
        echo $builditems[$key]['BuildItems']['quantity'];
        echo '&nbsp;';
        echo $builditems[$key]['BuildItems']['name'];
        echo '</LI>';
    }
    echo '</UL>';
?>