@php
    $charts_data = \App\Classes\HistoryCharts::make_chart('index_yandex_domain_'.$dataTypeContent['id'], $depth = 365);
    $list = $charts_data['list'];
@endphp
<div id="index_yandex_container"></div>

@push('javascript')
    <script type="text/javascript">
        $(function () {
            Highcharts.chart('index_yandex_container', {
                chart: {
                    type: 'column'
                },
                title: false,
                xAxis: {
                    categories: {!! json_encode(array_keys($list)) !!},
                    crosshair: true,
                    accessibility: {
                        description: '{{ __("Yandex index") }}'
                    }
                },
                yAxis: {
                    title: {
                        text: '{{ __("Yandex index") }}'
                    }
                },
                series: [
                    {
                        name: '{{ __("Yandex index") }}',
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
