@php
    $account_data_edit_messages = [
        'yandex_metrika_counter_label'=>__('Yandex metrika counter'),
        'yandex_metrika_counter_placeholder'=>__('CounterID'),
    ];

    $accounts = [];
    $arr = App\Models\Account::get();
    if (!empty($arr->isNotEmpty())) {
        foreach ($arr as $value) {
            $accounts[$value->id] = [
                'id' => $value->id,
                'title' => $value->title,
                'type' => $value->type,
            ];
        }
    }


@endphp
<input
    class="{{'row_field_'.$row->field}}"
    type="hidden"
    name="{{$row->field}}"
    value="{{$dataTypeContent[$row->field]}}"
    style="width: 100%;"
/>

<div class="app-domain_accounts_data_edit-component class-edit-component">
    <domain_accounts_data_edit-component
        field_name='{{$row->field}}'
        field_value='{{ $dataTypeContent[$row->field] }}'
        :lang='{{ json_encode($account_data_edit_messages, JSON_UNESCAPED_UNICODE) }}'
        :accounts='{{ json_encode($accounts, JSON_UNESCAPED_UNICODE) }}'
    ></domain_accounts_data_edit-component>
</div>


