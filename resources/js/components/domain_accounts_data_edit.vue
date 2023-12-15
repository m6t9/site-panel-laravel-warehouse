<template>
    <div class="accounts_data_edit_wrapper">

        <div v-if="yandex_metrika_counter_selected" class="form-group row">
            <label class="col-sm-2 col-form-label">{{ lang.yandex_metrika_counter_label }}</label>
            <div class="col-sm-10">
                <input type="text"
                       class="form-control w100"
                       :placeholder="lang.yandex_metrika_counter_placeholder"
                       v-model="inputs.yandex_metrika_counter_id"
                />
            </div>
        </div>

    </div>

</template>
<script>
export default {
    props: [
        'field_name',
        'field_value',
        'lang',
        'accounts'
    ],
    data() {
        return {
            yandex_metrika_counter_selected: false,
            inputs:{
                yandex_metrika_counter_id: "",
            },
        }
    },
    created() {
        let self = this;

        document.addEventListener('DOMContentLoaded', function () {
            self.actualize_accounts();
            $('select[name="domain_belongstomany_account_relationship[]"]').on('change', function () {
                self.actualize_accounts();
            });
        });

        try {
            let s  = JSON.parse(this.field_value);
            if (s !== null){
                this.inputs = s;
            }
        } catch (_error) {
        }

    },
    methods: {
        actualize_accounts(){
            let accs = $('select[name="domain_belongstomany_account_relationship[]"]').val();

            let new_yandex_metrika_counter_selected = false;
            for (var key in accs) {
                let id = parseInt(accs[key]);
                if (typeof this.accounts[id] !== "undefined"){
                    if (this.accounts[id]['type'] === 'yandex_metrika'){
                        new_yandex_metrika_counter_selected = true;
                    }
                }
            }

            this.yandex_metrika_counter_selected = new_yandex_metrika_counter_selected;
        }
    },
    computed: {
        inputs_value() {
            return JSON.stringify(this.inputs);
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
.accounts_data_edit_wrapper .btn-ico {
    font-size: 20px;
    line-height: 20px;
    height: 33px;
}

.accounts_data_edit_wrapper .w100 {
    width: 100%;
}
</style>
