<?php

namespace App\Voyager\FormFields;

use TCG\Voyager\FormFields\AbstractHandler;

class ColorClassField extends AbstractHandler
{
    protected $codename = 'color_class';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('formfields.color_class', [
            'row' => $row,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent,
            'options' => $options,
        ]);
    }
}
