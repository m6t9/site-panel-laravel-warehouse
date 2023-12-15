@php
    $info = $data->{$row->field};
@endphp
@if($info!='' and !is_null($info))
    <div class="domain_info">
        {{ $info }}
    </div>
@endif
