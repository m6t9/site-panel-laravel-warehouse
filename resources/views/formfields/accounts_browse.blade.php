@php
    $field_value = $data->accounts;
@endphp
@if($field_value->isNotEmpty())
    <div class="accounts-browse-col">
        @foreach($field_value as $value)
            @php
                $short = $value->type;
                $short = str_replace('yandex_', 'ya_', $short);
                $short = str_replace('google_', 'gg_', $short);
                $short = str_replace('_metrika', '_cnt', $short);
                $short = str_replace('_webmaster', '_wm', $short);
            @endphp
            <span
                class="accounts-browse-item"
                title="{{$value->title}}"
            >
                {{ $short }}
            </span>
        @endforeach
    </div>
@endif
