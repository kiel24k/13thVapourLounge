import { createWebHistory, createRouter } from "vue-router";

const routes = [
    {
        path: "/",
        component: () => import("../pages/client/Client_Home.vue"),
        name: "home-dashboard",
    },
    {
        path: '/login',
        component: () => import('../auth/Login.vue'),
        name: 'login'
    },
    {
        path: '/signup',
        component: () => import('../auth/Signup.vue'),
        name: 'signup'
    },
    {
        path: '/products',
        component: () => import('../pages/client/Client_Products.vue'),
        name: 'client-products'
    },
    {
        path: '/client-profile',
        component: ()=> import('../pages/client/Client_Profile.vue'),
        name: 'client-profile'
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

// router.beforeEach((to, from) => {
//     const token = localStorage.getItem('userT')
// })

export default router;
