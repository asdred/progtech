<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class StoreForm extends Form
{

    /**
     * Initialize the companies form
     */
    public function initialize($entity = null, $options = array())
    {
        if (!isset($options['edit'])) {
            $element = new Text("id");
            $this->add($element->setLabel("Id"));
        } elseif (!isset($options['create'])) {
            $this->add(new Hidden("id"));
        }

        $owner = new MySelect('owner_id', Owner::find(array(array("del" => 0))), $entity->owner_id);
        $owner->setLabel('Владелец');
        $this->add($owner);
        
        $name = new Text("name");
        $name->setLabel("Название");
        $name->setFilters(array('striptags', 'string'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Name is required'
            ))
        ));
        $this->add($name);
    }
}