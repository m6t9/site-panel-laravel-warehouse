import { createApp } from 'vue';

let app=createApp({})
app.component('domain_accounts_data_edit-component', require('./components/domain_accounts_data_edit.vue').default);
app.mount(".app-domain_accounts_data_edit-component")
