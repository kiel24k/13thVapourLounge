import { createWebHistory, createRouter } from "vue-router";

const routes = [
    {
        path: "/",
        component: () => import("../pages/client/Client_Home.vue"),
        name: "home-dashboard",
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

// router.beforeEach((to, from) => {
//     const token = localStorage.getItem('userT')
// })

export default router;
