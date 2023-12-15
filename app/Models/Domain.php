<?php

namespace App\Models;

use App\Classes\TagsFilter;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Domain extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public $perPage = 500;

    /**
     * @return array|mixed
     */
    public function whois_array()
    {
        $arr = [];
        if (!empty($this->whois) and $this->whois != '{}' and $this->whois != '[]') {
            $arr = @json_decode($this->whois, true);
        }

        return $arr;
    }

    /**
     * @return array|mixed
     */
    public function index_yandex_info_array()
    {
        $arr = [];
        if (!empty($this->index_yandex_info) and $this->index_yandex_info != '{}' and $this->index_yandex_info != '[]') {
            $arr = @json_decode($this->index_yandex_info, true);
        }

        return $arr;
    }

    /**
     * @return array|mixed
     */
    public function yandex_x_info_array()
    {
        $arr = [];
        if (!empty($this->yandex_x_info) and $this->yandex_x_info != '{}' and $this->yandex_x_info != '[]') {
            $arr = @json_decode($this->yandex_x_info, true);
        }

        return $arr;
    }

    /**
     * @return array|mixed
     */
    public function traffic_info_array()
    {
        $arr = [];
        if (!empty($this->traffic_info) and $this->traffic_info != '{}' and $this->traffic_info != '[]') {
            $arr = @json_decode($this->traffic_info, true);
        }

        return $arr;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function accounts()
    {
        return $this->belongsToMany(Account::class, 'domain_accounts')->orderBy('order', 'asc');
    }

    /**
     * @return array|mixed
     */
    public function accounts_data_array()
    {
        $arr = [];
        if (!empty($this->accounts_data) and $this->accounts_data != '{}' and $this->accounts_data != '[]') {
            $arr = @json_decode($this->accounts_data, true);
        }

        return $arr;
    }

}
