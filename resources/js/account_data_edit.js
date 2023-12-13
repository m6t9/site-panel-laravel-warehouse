import { createApp } from 'vue';

let app=createApp({})
app.component('account_data_edit-component', require('./components/account_data_edit.vue').default);
app.mount(".app-account_data_edit-component")
