
<H5>Date Format</H5>
<p>
    The datetime format field should use the notation from PHP's <a href="http://php.net/manual/en/function.date.php">date</a> function.
</p>
<p>
    For example, if the date were <?php echo date("F j, Y"); ?>...
<ul><LI>
        Entering "m.d.y" would yield the date as: <?php echo date("m.d.y"); ?>
    </LI>
    <LI>
        Entering "Y-m-d" would yield the date as: <?php echo date("Y-m-d"); ?>
    </LI>
    <LI>
        Sophisticated date and time formats are not tested!
    </LI>
</ul>