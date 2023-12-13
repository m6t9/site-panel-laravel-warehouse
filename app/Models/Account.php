<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public const types = [
        'li' => [
            'title' => 'LiveInternet statistics',
        ],
        'yandex_xml' => [
            'title' => 'Yandex XML',
        ],
        'yandex_metrika' => [
            'title' => 'Yandex Metrika',
        ],
        'google_analytics' => [
            'title' => 'Google Analytics',
        ],
    ];

    /**
     * @return array|mixed
     */
    public function account_data_array()
    {
        $arr = @json_decode($this->account_data, true);
        if (empty($arr)){
            $arr = [];
        }

        return $arr;
    }

}
