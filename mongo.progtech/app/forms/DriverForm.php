<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class DriverForm extends Form
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

        $name = new Text("name");
        $name->setLabel("И.Фамилия");
        $name->setFilters(array('striptags', 'string'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Name is required'
            ))
        ));
        $this->add($name);
        
        $experience = new Text("experience");
        $experience->setLabel("Стаж");
        $experience->setFilters(array('striptags', 'int'));
        $experience->addValidators(array(
            new PresenceOf(array(
                'message' => 'experience is required'
            ))
        ));
        $this->add($experience);
        
        $salary = new Text("salary");
        $salary->setLabel("Зарплата");
        $salary->setFilters(array('striptags', 'trim', 'int'));
        $salary->addValidators(array(
            new PresenceOf(array(
                'message' => 'salary is required'
            ))
        ));
        $this->add($salary);
    }

}