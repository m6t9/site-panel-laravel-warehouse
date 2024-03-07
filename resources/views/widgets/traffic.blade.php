<div id="widget_traffic_container"></div>

@push('javascript')
    <script type="text/javascript">
        $(function () {
            Highcharts.chart('widget_traffic_container', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '{{ __("Traffic for the last year") }}',
                    align: 'left'
                },
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
