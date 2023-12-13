@php
    $url = $data->{$row->field};
@endphp
@if(!empty($url))
    <a
        href="{{$url}}"
        target="_blank"
        title="{{$url}}"
    >
        <span class="badge badge-pill badge-info">
            {{__('Link')}}
        </span>
    </a>
@else
    -
@endif


