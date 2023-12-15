@php
    $hosting = $data->{$row->field};
    if ($hosting){
        $hosting = App\Models\Hosting:: find($hosting);
    }
@endphp
@if($hosting)
    @if(!empty($hosting->url))
        <a
            href="{{$hosting->url}}"
            target="_blank"
            title="{{__('Opens in a new window')}}"
        >
    @endif

    {{$hosting->title}}
    @if(!empty($hosting->account))
        <span class="badge badge-pill badge-info">{{$hosting->account}}</span>
    @endif

    @if(!empty($hosting->url))
        </a>
    @endif
@else
@endif
