@php
    $hostings = App\Models\Hosting::get();
@endphp
@if($hostings->isNotEmpty())
    <select class="form-control" name="{{$row->field}}">
        <option value="0" @if(empty($dataTypeContent[$row->field])) selected @endif>-</option>
        @foreach($hostings as $hosting)
            <option
                value="{{$hosting->id}}"
                @if($hosting->id==$dataTypeContent[$row->field]) selected @endif
            >
                {{$hosting->title}}
                @if(!empty($hosting->account))
                    - {{$hosting->account}}
                @endif
            </option>
        @endforeach
    </select>
@else
    -
@endif
