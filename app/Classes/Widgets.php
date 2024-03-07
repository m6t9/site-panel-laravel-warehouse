<?php

namespace App\Classes;

use App\Models\History;

class Widgets
{


    /**
     * Виджет Трафик
     *
     * @param $depth
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    function widget_traffic($depth = 365)
    {
        $data = HistoryCharts::make_chart('traffic_all', $depth = 365);

        return view('widgets.traffic', $data);
    }

}
