<?php

namespace App\Classes;

use App\Models\History;
use DateTime;

class HistoryCharts
{

    /**
     * Данные для графика
     *
     * @param $type
     * @param $depth
     *
     * @return array
     */
    static function make_chart($type, $depth = 365)
    {
        $data = [
            'date_from' => date('Y-m-d', strtotime('-' . $depth . ' days')),
            'date_to'   => date('Y-m-d', strtotime('-1 days')),
            'list'      => [],
        ];

        $history = History::where('type', $type)
                          ->whereBetween('date', [$data['date_from'], $data['date_to']])
                          ->orderBy('date', 'ASC')
                          ->get()
                          ->keyBy('date')
                          ->toArray();

        if (!empty($history)) {
            $data['date_from'] = array_key_first($history);
            $data['date_to'] = array_key_last($history);

            $date2 = new DateTime($data['date_from']);
            $date1 = new DateTime($data['date_to']);
            $dayDiff = (int)$date2->diff($date1)->format('%a');

            if ($dayDiff > 0){
                for ($i = $dayDiff; $i >= 0; $i--) {
                    $date = date('Y-m-d', strtotime('-' . $i . ' days', strtotime($data['date_to'])));

                    $data['list'][$date] = 0;

                    if (!empty($history[$date])) {
                        $data['list'][$date] = $history[$date]['value'];
                    }
                }
            }
        }

        return $data;
    }

}
