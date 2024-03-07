@extends('voyager::master')

@php
    $widgets = new App\Classes\Widgets();
@endphp

@section('content')
    <div class="page-content">
        @include('voyager::alerts')
        @include('voyager::dimmers')
    </div>

    <div class="page-content container-fluid">

        <div class="row">
            <div class="col-md-12">
                {{ $widgets->widget_traffic() }}
            </div>
        </div>

    </div>
@stop
