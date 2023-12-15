@php
    $index_yandex = $data->{$row->field};
    $index_yandex_info = $data->index_yandex_info_array();

    $date = '-';
    $success = false;
    if (isset($index_yandex_info['date'])){
        $date = date('Y-m-d',strtotime($index_yandex_info['date']));

        $lag = time() - strtotime($index_yandex_info['date']);
        if ($lag < (60*60*24*2)){
            $success = true;
        }
    }

@endphp
@if ($date != '-')
    <span title="{{ __('Data from') }} {{$date}}">
        @if (isset($success))
            {{$index_yandex}}
        @else
            <span class="text-danger">{{$index_yandex}}</span>
        @endif
    </span>
@endif
