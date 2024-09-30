import { createWebHistory, createRouter } from "vue-router";

const routes = [
    //======================Client routes=============================//
    {
        path: "/",
        component: () => import("../pages/client/Client_Home.vue"),
        name: "home-dashboard",
    },
    {
        path: "/login",
        component: () => import("../auth/Login.vue"),
        name: "login",
    },
    {
        path: "/signup",
        component: () => import("../auth/Signup.vue"),
        name: "signup",
    },
    {
        path: "/products",
        component: () => import("../pages/client/Client_Products.vue"),
        name: "client-products",
    },
    {
        path: "/client-profile",
        component: () => import("../pages/client/Client_Profile.vue"),
        name: "client-profile",
    },
    //======================Admin routes=============================//
    {
        path: "/admin-dashboard",
        component: () => import("../pages/admin/Admin_Dashboard.vue"),
        name: "admin-dashboard",
    },
    {
        path: "/admin-products",
        component: () => import("../pages/admin/Admin_Products.vue"),
        name: "admin-products",
    },
    {
        path: "/admin-category-list",
        component: () => import("../pages/admin/Admin_Category_List.vue"),
        name: "admin-category-list",
    },
    //======================Sub-Admin routes=============================//
    {
        path: "/sub-admin-dashboard",
        component: () => import("../pages/sub-admin/Sub_Dashboard.vue"),
        name: "sub-admin-dashboard",
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
