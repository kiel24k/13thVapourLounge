import "./bootstrap";
import 'primeicons/primeicons.css'
import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import "bootstrap/dist/css/bootstrap.min.css";
import { createPinia } from "pinia";
import PrimeVue from 'primevue/config';
import Aura from '@primevue/themes/aura';
import ConfirmationService from "primevue/confirmationservice";
import DialogService from "primevue/dialogservice";
import ToastService from "primevue/toastservice";


const app = createApp(App);

app.use(PrimeVue, {
    theme: {
        preset: Aura,
        options: {
            prefix: 'p',
            darkModeSelector: 'light',
            cssLayer: false
        }
    }
 });
const pinia = createPinia();
app.use(ConfirmationService);
app.use(ToastService);
app.use(DialogService);
app.use(router);
app.use(pinia);
app.use(PrimeVue);
app.mount("#app");
