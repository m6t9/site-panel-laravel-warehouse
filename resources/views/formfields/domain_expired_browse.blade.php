@php
    $expired = $data->{$row->field};
    $whois_array = $data->whois_array();

    $whois_date = '-';
    if (isset($whois_array['whois_date'])){
        $whois_date = date('Y-m-d',strtotime($whois_array['whois_date']));
    }

    $whois_expired = '';
    if (isset($whois_array['expired'])){
        $whois_expired = $whois_array['expired'];
    }

@endphp

<a href="https://www.nic.ru/whois/?query={{$data->domain}}"
   target="_blank"
   class="@if($expired != $whois_expired) badge badge-danger @endif"
   title="{{ __('Whois from').' «'.$whois_date.'»'."\n".$whois_expired }}"
>
    {{ $expired  }}
</a>

