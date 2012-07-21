<?php
    // http://www.willis-owen.co.uk/2011/11/dynamic-select-box-with-cakephp-2-0/

// this view is used to refresh the Area select box in the Add District form on
// the admin page
foreach ($areas as $key => $value): ?>
    <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
<?php endforeach; ?>
