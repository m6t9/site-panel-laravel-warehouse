@php
    $charts_data = \App\Classes\HistoryCharts::make_chart('yandex_x_domain_'.$dataTypeContent['id'], $depth = 365);
    $list = $charts_data['list'];
@endphp
<div id="yandex_x_container"></div>

@push('javascript')
    <script type="text/javascript">
        $(function () {
            Highcharts.chart('yandex_x_container', {
                chart: {
                    type: 'column'
                },
                title: false,
                xAxis: {
                    categories: {!! json_encode(array_keys($list)) !!},
                    crosshair: true,
                    accessibility: {
                        description: '{{ __("Yandex X") }}'
                    }
                },
                yAxis: {
                    title: {
                        text: '{{ __("Yandex X") }}'
                    }
                },
                series: [
                    {
                        name: '{{ __("Yandex X") }}',
                        data: {!! json_encode(array_values($list)) !!}
                    }
                ],
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                credits: {
                    enabled: false
                },
                legend: {
                    enabled: false
                },
            });
        });
    </script>

@endpush
