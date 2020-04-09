<template>
  <div class="app-sidebar colored">
                    <div class="sidebar-header">
                        <a class="header-brand" href="javascript:void(0)">
                            <div class="logo-img">
                               <img src="/img/admin/brand-white.svg" class="header-brand-img" alt="lavalite">
                            </div>
                            <span class="text">The James</span>
                        </a>
                        <button type="button" class="nav-toggle"><i data-toggle="expanded" class="ik ik-toggle-right toggle-icon"></i></button>
                        <button id="sidebarClose" class="nav-close"><i class="ik ik-x"></i></button>
                    </div>

                    <div class="sidebar-content">
                        <div class="nav-container">
                            <nav id="main-menu-navigation" class="navigation-main">
                                <div class="nav-lavel">Navigation</div>
                                <div class="nav-item active">
                                    <router-link tag="a" to="/" ><i class="ik ik-bar-chart-2"></i><span>Dashboard</span></router-link>
                                </div>
                                <div class="nav-lavel">Đơn hàng</div>
                                <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-shopping-cart"></i><span>Đơn hàng </span></a>
                                    <div class="submenu-content">
                                        <router-link tag="a" to="/bill" class="menu-item">Đang chờ</router-link>
                                    </div>
                                    <div class="submenu-content">
                                        <router-link tag="a" to="/bill-success" class="menu-item">Đơn  hoàn thành</router-link>
                                    </div>
                                </div>
                                <div class="nav-lavel">Sản Phẩm</div>
                                <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-package"></i><span>Sản Phẩm</span></a>
                                    <div class="submenu-content">
                                          <router-link tag="a" to="/product" class="menu-item">Danh Sách</router-link>
                                    </div>
                                    <div class="submenu-content">
                                       <router-link tag="a" to="/product/create" class="menu-item">Thêm mới</router-link>
                                    </div>
                                </div>
                                <div class="nav-item">
                                    <router-link tag="a" to="/category"><i class="ik ik-database"></i>Thể loại</router-link>
                                </div>
                               <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-git-branch"></i><span>Hãng sản xuất</span></a>
                                    <div class="submenu-content">
                                          <router-link tag="a" to="/type" class="menu-item">Danh Sách</router-link>
                                    </div>
                                    <div class="submenu-content">
                                       <router-link tag="a" to="/type/create" class="menu-item">Thêm mới</router-link>
                                    </div>
                                </div>
                                    <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-user"></i><span>Người dùng</span></a>
                                    <div class="submenu-content">
                                          <router-link tag="a" to="/user" class="menu-item">Danh Sách</router-link>
                                    </div>
                                    <div class="submenu-content">
                                       <router-link tag="a" to="/user/create" class="menu-item">Thêm mới</router-link>
                                    </div>
                                </div>
                                <div class="nav-lavel">Other</div>
                            </nav>
                        </div>
                    </div>
                </div>
</template>
<style>
    .cate-link{
        font-size: 15px
    }
</style>
