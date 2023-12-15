@php
    $traf = (int)$data->{$row->field};
    $traf_info = $data->traffic_info_array();
@endphp
@if(!empty($traf_info['date']))
    <span title="{{ __('Data from') }} {{ $traf_info['date']."\n".__('Source of information') }} :{{ $traf_info['source'] }}">
        {{ $traf }}
    </span>
@endif
