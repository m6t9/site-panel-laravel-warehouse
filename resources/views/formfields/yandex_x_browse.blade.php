@php
    $yandex = $data->{$row->field};
    $yandex_info = $data->yandex_x_info_array();

    $date = '-';
    $success = false;
    if (isset($yandex_info['date'])){
        $date = date('Y-m-d',strtotime($yandex_info['date']));

        $lag = time() - strtotime($yandex_info['date']);
        if ($lag < (60*60*24*2)){
            $success = true;
        }
    }

@endphp
@if ($date != '-')
    <span title="{{ __('Data from') }} {{$date}}">
        @if (isset($success))
            {{$yandex}}
        @else
            <span class="text-danger">{{$yandex}}</span>
        @endif
    </span>
@endif
