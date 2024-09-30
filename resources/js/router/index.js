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
        path: "/admin-orders-list",
        component: () => import("../pages/admin/Admin_Orders.vue"),
        name: 'admin-orders'
    },
    {
        path: "/admin-products",
        component: () => import("../pages/admin/Admin_Products.vue"),
        name: "admin-products",
    },
    {
        path: "/admin-user-list",
        component: () => import("../pages/admin/Admin_User_List.vue"),
        name: "admin-user-list",
    },
    {
        path: '/admin-profile',
        component: () => import("../pages/admin/Admin_Profile_List.vue"),
        name: "admin-profile-list"
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
