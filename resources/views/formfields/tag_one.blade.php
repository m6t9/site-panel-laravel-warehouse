<span
    class="tags-browse-tag {{$tag->color}}"
    @if(!empty($tag->tooltip)) title="{{$tag->tooltip}}" @endif
>
    @if(!empty($tag->ico))
        <i class="{{$tag->ico}}"></i>
    @endif
    @if(!empty($tag->title))
        <span class="tags-browse-tag-title">{{$tag->title}}</span>
    @endif
</span>

