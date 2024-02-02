@php
    $tags = $data->tags()->get();
@endphp

@if($tags->isNotEmpty())
    <div class="tags-browse-col">
        @foreach($tags as $tag)
            @include('formfields.tag_one')
        @endforeach
    </div>
@endif

