<template>
    <div class="account_data_edit_wrapper">

        <template v-if="account_type=='yandex_metrika'">

            <div class="row mb-2">
                <div class="col-sm-12" v-html="lang.yandex_metrika_description"></div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_metrika_client_id_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_metrika_client_id_placeholder"
                           v-model="inputs.yandex_metrika.client_id"
                    />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_metrika_client_secret_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_metrika_client_secret_placeholder"
                           v-model="inputs.yandex_metrika.client_secret"
                    />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_metrika_token_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_metrika_token_placeholder"
                           v-model="inputs.yandex_metrika.token"
                    />
                </div>
                <div class="col-sm-2" v-if="inputs.yandex_metrika.client_id != ''">
                    <a :href="'https://oauth.yandex.ru/authorize?response_type=token&client_id=' + inputs.yandex_metrika.client_id"
                       target="_blank"
                    >{{ lang.yandex_metrika_token_link }}</a>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_metrika_expiry_date_label }}</label>
                <div class="col-sm-5">
                    <input type="date"
                           class="form-control w100"
                           v-model="inputs.yandex_metrika.expiry_date"
                    />
                </div>
            </div>

        </template>

        <template v-else-if="account_type=='yandex_webmaster'">

            <div class="row mb-2">
                <div class="col-sm-12" v-html="lang.yandex_webmaster_description"></div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_webmaster_client_id_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_webmaster_client_id_placeholder"
                           v-model="inputs.yandex_webmaster.client_id"
                    />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_webmaster_client_secret_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_webmaster_client_secret_placeholder"
                           v-model="inputs.yandex_webmaster.client_secret"
                    />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_webmaster_token_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_webmaster_token_placeholder"
                           v-model="inputs.yandex_webmaster.token"
                    />
                </div>
                <div class="col-sm-2" v-if="inputs.yandex_webmaster.client_id != ''">
                    <a :href="'https://oauth.yandex.ru/authorize?response_type=token&client_id=' + inputs.yandex_webmaster.client_id"
                       target="_blank"
                    >{{ lang.yandex_webmaster_token_link }}</a>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_webmaster_expiry_date_label }}</label>
                <div class="col-sm-5">
                    <input type="date"
                           class="form-control w100"
                           v-model="inputs.yandex_webmaster.expiry_date"
                    />
                </div>
            </div>

        </template>

        <template v-else-if="account_type=='yandex_xml'">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_xml_key_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_xml_key_placeholder"
                           v-model="inputs.yandex_xml.key"
                    />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{{ lang.yandex_xml_user_label }}</label>
                <div class="col-sm-5">
                    <input type="text"
                           class="form-control w100"
                           :placeholder="lang.yandex_xml_user_placeholder"
                           v-model="inputs.yandex_xml.user"
                    />
                </div>
            </div>
        </template>

        <template v-else-if="account_type=='google_analytics'">
            ToDo
        </template>

        <div v-else class="form-group mb-2" style="width:20%;">
        </div>

    </div>

</template>
<script>
export default {
    props: [
        'field_name',
        'field_value',
        'lang'
    ],
    data() {
        return {
            account_type: false,
            inputs:{
                yandex_xml: {
                    key: "",
                    user: "",
                },
                yandex_metrika: {
                    client_id: "",
                    client_secret: "",
                    token: "",
                    expiry_date: "",
                },
                yandex_webmaster: {
                    client_id: "",
                    client_secret: "",
                    token: "",
                    expiry_date: "",
                },
                google_analytics: {
                    test: "",
                }
            },
        }
    },
    created() {
        let self = this;

        document.addEventListener('DOMContentLoaded', function () {
            self.actualize_account_type();
            $('select[name="type"]').on('change', function () {
                self.actualize_account_type();
            });
        });
        self.actualize_account_type();

        try {
            let i  = JSON.parse(this.field_value);
            switch(this.account_type) {
                case 'yandex_metrika':
                    this.inputs.yandex_metrika = i;
                    break
                case 'yandex_webmaster':
                    this.inputs.yandex_webmaster = i;
                    break
                case 'yandex_xml':
                    this.inputs.yandex_xml = i;
                    break
                case 'google_analytics':
                    this.inputs.google_analytics = i;
                    break
            }
        } catch (_error) {
        }

    },
    methods: {
        actualize_account_type(){
            this.account_type = $('select[name="type"]').find(":selected").val();
        }
    },
    computed: {
        inputs_value() {
            let i = this.inputs.yandex_metrika;
            switch(this.account_type) {
                case 'yandex_metrika':
                    i = this.inputs.yandex_metrika;
                    break
                case 'yandex_webmaster':
                    i = this.inputs.yandex_webmaster;
                    break
                case 'yandex_xml':
                    i = this.inputs.yandex_xml;
                    break
                case 'google_analytics':
                    i = this.inputs.google_analytics;
                    break
            }

            return JSON.stringify(i);
        }
    },
    watch: {
        inputs_value(val) {
            $('.row_field_' + this.field_name).val(val);
        }
    },
}
</script>
<style>
.account_data_edit_wrapper .btn-ico {
    font-size: 20px;
    line-height: 20px;
    height: 33px;
}

.account_data_edit_wrapper .w100 {
    width: 100%;
}
</style>
