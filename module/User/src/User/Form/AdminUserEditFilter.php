<?php

namespace User\Form;

use Zend\Db\Adapter\Adapter;
use Zend\InputFilter\InputFilter;

class AdminUserEditFilter extends InputFilter
{
    public function __construct(Adapter $dbAdapter, $user)
    {
        $this->add([
            'name' => 'first_name',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'StringLength',
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 1,
                        'max' => 255,
                    ],
                ],
            ],
        ]);

        $this->add([
            'name' => 'last_name',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'StringLength',
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 1,
                        'max' => 255,
                    ],
                ],
            ],
        ]);

        $this->add([
            'name' => 'email',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'StringLength',
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 1,
                        'max' => 100,
                    ],
                ],
                [
                  'name' => 'EmailAddress',
                  'options' => [
                    'allow' => \Zend\Validator\Hostname::ALLOW_DNS,
                    'useMxCheck' => false,
                  ],
                ],
                [
                  'name' => 'Zend\Validator\Db\NoRecordExists',
                  'options' => [
                    'adapter' => $dbAdapter,
                    'table' => 'user',
                    'field' => 'email',
                    'exclude' => [
                      'field' => 'id',
                      'value' => $user->getId(),
                    ],
                  ],
                ],
            ],
        ]);

        $this->add([
            'name' => 'role',
            'required' => true,
            'validators' => [
              [
                'name' => 'InArray',
                'options' => [
                  'haystack' => ['', 'admin', 'member'],
                ],
              ],
            ],
        ]);

    }
}
