<?php
/*
Статистика по трафику счетчика LI
*/

namespace App\Classes;

class LiCounter
{
    private $client;
    private $response;

    function get($url, $use_cookies = false)
    {
        $this->response = null;

        try {
            if (!$this->client) {
                $this->client = new \GuzzleHttp\Client(['cookies' => $use_cookies]);
            }

            if ($this->client) {
                $r = $this->client->request('GET', $url);
                if ($r->getStatusCode() == 200) {
                    $this->response = $r->getBody();
                }
            }

        } catch (\Exception $e) {
            $this->response = null;
        }

    }

    function post($url, $use_cookies = false, $post_data = [])
    {
        $this->response = null;

        try {
            if (!$this->client) {
                $this->client = new \GuzzleHttp\Client(['cookies' => $use_cookies]);
            }

            if ($this->client) {
                $r = $this->client->request('POST', $url, ['form_params' => $post_data]);
                if ($r->getStatusCode() == 200) {
                    $this->response = $r->getBody();
                }
            }

        } catch (\Exception $e) {
            $this->response = null;
        }

    }

    public function get_count_open($domain)
    {
        $result = null;

        $this->client = null;
        $this->get('http://counter.yadro.ru/values?site=' . $domain);
        if ($this->response) {
            preg_match_all('/LI_day_vis\s{0,}\=\s{0,}(\d+?);/', $this->response, $matches);
            if (isset($matches[1][0])) {
                $result = (int)$matches[1][0];
            }
        }

        return $result;
    }

    public function get_count($domain, $pass)
    {
        $result = null;

        $this->client = null;
        $this->get('http://pda.liveinternet.ru/stat/' . $domain . '/index.html', true);
        if ($this->response) {

            // Поиск rnd и вход
            $pattern = '/name\s{0,}\=\s{0,}["\']{0,}rnd["\']{0,}\s{0,}value\s{0,}\=\s{0,}["\']{0,}(\d+?)["\']?>/';
            preg_match_all($pattern, $this->response, $matches);
            if (isset($matches[1][0])) {
                $rnd = $matches[1][0];

                $post = array('url' => 'http://' . $domain . '/', 'rnd' => $rnd, 'password' => $pass);
                $this->post('http://pda.liveinternet.ru/stat/' . $domain . '/index.html', true, $post);

                // Проверка входа
                if ($this->response and mb_substr_count($this->response, 'value="logout.html">выход</option>',
                        'UTF-8') > 0) {

                    $date = date("Y-m-d", strtotime("yesterday"));

                    $this->get('http://pda.liveinternet.ru/stat/' . $domain . '/index.html?date=' . $date, true);
                    if ($this->response) {
                        $pattern = '/<td\s{1,}align\s{0,}=\s{0,}left>Посетители<\/td>\s{0,}<td>(\d+?)</u';
                        preg_match_all($pattern, $this->response, $matches);
                        if (isset($matches[1][0])) {
                            $result = (int)$matches[1][0];
                        }
                    }

                }
            }
        }

        return $result;
    }

}
