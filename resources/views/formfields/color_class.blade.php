<input type="text"
       id="input_{{$row->id}}"
       class="form-control"
       name="{{ $row->field }}"
       value="@if(isset($dataTypeContent->{$row->field})){{ old($row->field, $dataTypeContent->{$row->field}) }}@else{{old($row->field)}}@endif"
/>
<div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#colorModal{{$row->id}}">
        Stiles
    </button>
</div>

@php
    $class_array = [
        "label bg-red",
        "label bg-yellow",
        "label bg-aqua",
        "label bg-blue",
        "label bg-light-blue",
        "label bg-green",
        "label bg-navy",
        "label bg-teal",
        "label bg-olive",
        "label bg-lime",
        "label bg-orange",
        "label bg-fuchsia",
        "label bg-purple",
        "label bg-maroon",
        "label bg-black",
        "label bg-red-active",
        "label bg-yellow-active",
        "label bg-aqua-active",
        "label bg-blue-active",
        "label bg-light-blue-active",
        "label bg-green-active",
        "label bg-navy-active",
        "label bg-teal-active",
        "label bg-olive-active",
        "label bg-lime-active",
        "label bg-orange-active",
        "label bg-fuchsia-active",
        "label bg-purple-active",
        "label bg-maroon-active",
        "label bg-black-active",
        "label alert-success",
        "label alert-danger",
        "label alert-error",
        "label alert-warning",
        "label alert-info",
        "label label-danger",
        "label label-info",
        "label label-warning",
        "label label-primary",
        "label label-success",
        ];
@endphp



<div id="colorModal{{$row->id}}" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog" role="document" style="min-width: 75%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Style</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                @foreach($class_array as $item)
                    <div class="col-md-3 col-sm-4">
                        <a href="javascript:void(0);" data-class="{{$item}}" class="link-class-picker">
                            <span class="{{$item}}"> {{$item}}</span>
                        </a>
                    </div>
                @endforeach
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

@push('javascript')
    <script type="text/javascript">
        $(function(){
            $('#colorModal{{$row->id}} .link-class-picker').on('click', function (e) {
                $('#input_{{$row->id}}').val($(this).data('class'));
                $('#colorModal{{$row->id}} .close').click();
            });
        });
    </script>
@endpush
