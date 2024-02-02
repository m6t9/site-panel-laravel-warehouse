<?php

namespace App\Voyager\FormFields;

use TCG\Voyager\FormFields\AbstractHandler;

class AwesomeIconField extends AbstractHandler
{
    protected $codename = 'awesome_icon';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('formfields.awesome_icon', [
            'row' => $row,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent,
            'options' => $options,
        ]);
    }
}
