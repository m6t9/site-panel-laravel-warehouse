@php
    $charts_data = \App\Classes\HistoryCharts::make_chart('traffic_domain_'.$dataTypeContent['id'], $depth = 365);
    $list = $charts_data['list'];
@endphp
<div id="traffic_container"></div>

@push('javascript')
    <script type="text/javascript">
        $(function () {
            Highcharts.chart('traffic_container', {
                chart: {
                    type: 'column'
                },
                title: false,
                xAxis: {
                    categories: {!! json_encode(array_keys($list)) !!},
                    crosshair: true,
                    accessibility: {
                        description: '{{ __("Visitors") }}'
                    }
                },
                yAxis: {
                    title: {
                        text: '{{ __("Visitors") }}'
                    }
                },
                series: [
                    {
                        name: '{{ __("Visitors") }}',
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
