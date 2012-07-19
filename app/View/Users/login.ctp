<BR><BR>
    <?php
        // display any messages here
        // these can be customized
        // http://book.cakephp.org/1.3/view/1252/Displaying-Auth-Error-Messages
        echo $this->Session->flash('auth');
    ?>
<BR><BR>
    <?php
        echo $this->Form->create('User');
    ?>
    <fieldset>
        <legend>
            <?php
                echo __('Please enter your username and password');
            ?>
        </legend>
        <?php
            echo $this->Form->input('username');
            echo $this->Form->input('password');
        ?>
    </fieldset>
<BR><BR>

    <?php
        echo $this->Form->end(__('Login'));
    ?>