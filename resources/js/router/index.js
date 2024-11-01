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
        path: "/products/:id",
        component: () => import("../pages/client/Client_Products.vue"),
        name: "client-products",
    },
    {
        path: "/cart",
        component: () => import("../pages/client/Client_Cart.vue"),
        name: "client-cart",
    },
    {
        path: "/my-profile",
        component: () => import("../pages/client/Client_Profile.vue"),
        name: "my-profile",
    },
    {
        path: "/products-overview/:products_name",
        component: () => import("../pages/client/Client_Products_Overview.vue"),
        name: "products-overview",
    },
    {
        path: "/my-address-book",
        component: () => import("../pages/client/Client_Address_Book.vue"),
        name: "my-address-book",
    },
    {
        path: "/my-order",
        component: () => import("../pages/client/Client_Order.vue"),
        name: "my-order",
    },
    {
        path: "/my-order-received",
        component: () => import("../pages/client/Client_Order_Received.vue"),
        name: "my-order-received",
    },
    {
        path: "/my-order-to-received",
        component: () => import("../pages/client/Client_Order_To_Received.vue"),
        name: "my-order-to-received",
    },
    {
        path: "/my-pending-order",
        component: () => import("../pages/client/Cllient_Order_Pending.vue"),
        name: "my-pending-order",
    },
    {
        path: "/my-place-order",
        component: () => import("../pages/client/Client_Place_Order.vue"),
        name: "my-place-order",
    },
    {
        path: "/my-order-complete",
        component: () => import("../pages/client/Client_Order_Complete.vue"),
        name: "my-order-complete",
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
        name: "admin-orders",
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
        path: "/admin-profile",
        component: () => import("../pages/admin/Admin_Profile.vue"),
        name: "admin-profile",
    },
    {
        path: "/admin-account-settings",
        component: () => import("../pages/admin/Admin_Account_Settings.vue"),
        name: "admin-account-settings",
    },
    {
        path: "/admin-dashboard",
        component: () => import("../pages/admin/Admin_Dashboard.vue"),
        name: "admin-dashboard",
    },
    {
        path: "/client-cancelation",
        component: () => import("../pages/client/Client_Cancelation.vue"),
        name: "client-cancelation",
    },
    {
        path: "/client-wishlist",
        component: () => import("../pages/client/Client_Wishlist.vue"),
        name: "client-wishlist",
    },
    //======================Sub-Admin routes=============================//
    {
        path: "/sub-admin-dashboard",
        component: () => import("../pages/sub-admin/Sub_Dashboard.vue"),
        name: "sub-admin-dashboard",
    },
    {
        path: "/test",
        component: () => import("../pages/test.vue"),
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
