@php
    $account_data_edit_messages = [
        'yandex_metrika_description'=>__('Register a new application:')
            .' <a href="https://oauth.yandex.ru/client/new" target="_blank">https://oauth.yandex.ru/client/new</a><br>'
            .__('Rights:').' metrika:read',

        'yandex_metrika_client_id_label'=>__('ClientID'),
        'yandex_metrika_client_id_placeholder'=>__('ClientID'),
        'yandex_metrika_client_secret_label'=>__('Client secret'),
        'yandex_metrika_client_secret_placeholder'=>__('Client secret'),
        'yandex_metrika_token_link'=>__('Token link'),
        'yandex_metrika_token_label'=>__('Token'),
        'yandex_metrika_token_placeholder'=>__('Token'),
        'yandex_metrika_expiry_date_label'=>__('Token expiry date'),

        'yandex_webmaster_description'=>__('Register a new application:')
            .' <a href="https://oauth.yandex.ru/client/new" target="_blank">https://oauth.yandex.ru/client/new</a><br>'
            .__('Rights:').' webmaster:verify, webmaster:hostinfo',

        'yandex_webmaster_client_id_label'=>__('ClientID'),
        'yandex_webmaster_client_id_placeholder'=>__('ClientID'),
        'yandex_webmaster_client_secret_label'=>__('Client secret'),
        'yandex_webmaster_client_secret_placeholder'=>__('Client secret'),
        'yandex_webmaster_token_link'=>__('Token link'),
        'yandex_webmaster_token_label'=>__('Token'),
        'yandex_webmaster_token_placeholder'=>__('Token'),
        'yandex_webmaster_expiry_date_label'=>__('Token expiry date'),

        'yandex_xml_key_label'=>__('Key'),
        'yandex_xml_key_placeholder'=>__('Key'),
        'yandex_xml_user_label'=>__('User'),
        'yandex_xml_user_placeholder'=>__('User'),
    ];
@endphp
<input
    class="{{'row_field_'.$row->field}}"
    type="hidden"
    name="{{$row->field}}"
    value="{{$dataTypeContent[$row->field]}}"
    style="width: 100%;"
/>

<div class="app-account_data_edit-component class-edit-component">
    <account_data_edit-component
        field_name='{{$row->field}}'
        field_value='{{ $dataTypeContent[$row->field] }}'
        :lang='{{ json_encode($account_data_edit_messages, JSON_UNESCAPED_UNICODE) }}'
    ></account_data_edit-component>
</div>


