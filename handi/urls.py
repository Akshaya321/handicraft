"""handicarft URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path
from.import views
urlpatterns = [
        path('',views.index,name='index'),
        path('ahome',views.ahome,name='ahome'),
        path('adhome',views.adhome,name='adhome'),
        path('hhome',views.ahome,name='hhome'),

        path('category',views.category,name='category'),
        path('categoryview/', views.categoryview, name="categoryview"),
        path('district',views.district,name='district'),
        path('districtview/', views.districtview, name="districtview"),
        path('location',views.locationadd,name='location'),
        path('locationview',views.locationview,name='locationview'),


        path('agencyregister',views.agencyreg,name='agencyreg'),
        path('agencyview',views.agencyview,name='agencyview'),
        path('approveagency/<id>',views.approveagency,name='approveagency'),
        path('agencyviewnotconfirmed', views.agencyviewnotconfirmed, name='agencyviewnotconfirmed'),
        path('agencyprofileedit', views.agencyprofileedit, name='agencyprofileedit'),
        path('customerregister',views.customerregister,name='customerregister'),


        path('handicraftregister',views.handiregister,name='handiregister'),
        path('viewhandicrafter',views.viewhandicrafter,name='viewhandicrafter'),
        path('approvehandicrafter/<id>',views.approvehandicrafter,name='approvehandicrafter'),
        path('viewhandicraftersbyadmin',views.viewhandicraftersbyadmin,name='viewhandicraftersbyadmin'),
        path('viewproducthandicrafter', views.viewproducthandicrafter, name='viewproducthandicrafter'),
        path('vieworderhandicrafter', views.vieworderhandicrafter, name='vieworderhandicrafter'),
        path('handiprofile', views.handiprofile, name='handiprofile'),


        path('addproduct',views.addproduct,name='addproduct'),
        path('agencyviewproduct',views.agencyviewproduct,name='agencyviewproduct'),
        path('approveproduct/<id>',views.approveproduct,name='approveproduct'),
        path('viewproduct',views.viewproduct,name='viewproduct'),
        path('addtocart', views.addtocart, name='addtocart'),
        path('viewcart', views.viewcart, name='viewcart'),
        path('removecart/<id>',views.removecart,name='removecart'),
        path('movetocartitem/<id>',views.movetocartitem,name='movetocartitem'),
        path('savecartitemlater/<id>', views.savecartitemlater, name='savecartitemlater'),
        path('viewbuyproduct',views.viewbuyproduct,name='viewbuyproduct'),
       # path('placeorderbuyproduct',views.placeorderbuyproduct,name='placeorderbuyproduct'),

        path('placeorder', views.placeorder, name='placeorder'),

        path('payment', views.payment, name='payment'),
        path('paymentbuyproduct', views.paymentbuyproduct, name='paymentbuyproduct'),

        path('reg',views.reg,name='reg'),

        path('logincheck',views.logincheck,name='logincheck'),
        path('agencyhome',views.agencyh,name='agengyh'),


        path('coustomerhome',views.coustomerh,name='coustomerh'),

        path('handicrafthome',views.handicrafth,name='handicrafth'),

        path('adminhome',views.adminh,name='adminh'),
        path('approve',views.approve,name='approve'),
        path('logout',views.logout,name='logout'),

]
