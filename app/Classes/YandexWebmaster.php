<?php
/*
 * // https://yandex.ru/dev/webmaster/
 */
namespace App\Classes;

use Illuminate\Support\Facades\Http;

class YandexWebmaster
{
    public $token;
    public $user_ids = [];
    public $hosts = [];

    public $url = 'https://api.webmaster.yandex.net/v4/';

    public $last_error = '';

    /**
     * @param $token
     *
     * @return bool
     */
    public function set_token($token)
    {
        $this->last_error = '';
        $this->token = $token;

        if (empty($this->user_ids[$this->token])) {

            $response = Http::withHeaders([
                'Authorization' => 'OAuth ' . $this->token,
            ])->get($this->url . 'user');

            if ($response->successful()) {
                $response = $response->json();
                if (!empty($response['user_id'])) {
                    $this->user_ids[$this->token] = $response['user_id'];
                }
            }

            if (empty($this->user_ids[$this->token])) {
                $this->last_error = 'Не удалось получить user_id';

                return false;
            }
        }

        if (!isset($this->hosts[$this->token])) {

            $response = Http::withHeaders([
                'Authorization' => 'OAuth ' . $this->token,
            ])->get($this->url . 'user/' . $this->user_ids[$this->token] . '/hosts');

            if ($response->successful()) {
                $response = $response->json();
                if (isset($response['hosts'])) {
                    $this->hosts[$this->token] = [];

                    if (!empty($response['hosts'])) {
                        foreach ($response['hosts'] as $host_value) {
                            if ($host_value['verified'] != 1) {
                                continue;
                            }

                            $host_url = parse_url($host_value['unicode_host_url']);
                            $host = $host_url['host'];
                            $host = preg_replace('/^www./Uuis', '', $host);

                            // Могут быть не главные зеркала
                            if (isset($this->hosts[$this->token][$host]) and !empty($host_value['main_mirror'])){
                                continue;
                            }

                            $this->hosts[$this->token][$host] = $host_value['host_id'];

                        }
                    }
                }
            }

            if (!isset($this->hosts[$this->token])) {
                $this->last_error = 'Не удалось получить список hosts';

                return false;
            }
        }

        return true;
    }


    /**
     * @param $domain
     *
     * @return mixed|null
     */
    public function get_summary($domain)
    {
        $this->last_error = '';
        $summary = null;

        if (empty($this->hosts[$this->token][$domain])) {
            $this->last_error = 'Сайт не обнаружен в аккаунте';

            return null;
        }

        $url = $this->url . 'user/' . $this->user_ids[$this->token] . '/hosts/' . $this->hosts[$this->token][$domain] . '/summary';

        $response = Http::withHeaders([
            'Authorization' => 'OAuth ' . $this->token,
        ])->get($url);

        if ($response->successful()) {

            $summary = $response->json();

        } else {
            $this->last_error = 'Запрос вернул ошибку';

            return null;
        }

        return $summary;
    }


}
