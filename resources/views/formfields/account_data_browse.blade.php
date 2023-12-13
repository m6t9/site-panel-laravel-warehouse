@php
    $content = '';

    $field_value_src = $data->{$row->field};
    $field_value =  [];
    if (!empty($field_value_src)){
        $field_value = @json_decode($field_value_src, true);
    }

    switch ($data['type']){
        case 'yandex_xml':
            $content = __('User').': '.$field_value['user'];
            break;
        case 'yandex_metrika':
            $content = __('Token expiry date').': '.$field_value['expiry_date'];
            break;
        case 'google_analytics':
            break;
    }
@endphp
{{$content}}
