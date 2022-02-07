from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from handi.models import Login,District,Agency,Category,CustomerReg,HandicrafterReg,Location,Product,Cart,bank
from django.db.models import Sum
from django.db.models import Q
# Create your views here.
def index(request):
    return render(request,"GuestUsers/Home.html")

def hhome(request):
    return render(request,'Handicrafter/HandicrafterHome.html')

def ahome(request):
    return render(request,'GuestUsers/Home.html')

def adhome(request):
    return render(request,'Admin/AdminHome.html')

def reg(request):
    if request.method == 'POST':
        login=Login()
        username = request.POST.get("username")
        password = request.POST.get("password")
        role= request.POST.get("role")
        login.username = username
        login.password = password
        login.role = role
        login.status=0
        login.save()
        reg = Register()
        firstname = request.POST.get("firstname")
        middlename = request.POST.get("middlename")
        lastname = request.POST.get("lastname")
        email = request.POST.get("email")
        role=request.POST.get("role")
        reg.firstname = firstname
        reg.middlename = middlename
        reg.lastname = lastname
        reg.email = email
        reg.role=role
        reg.login = login
        reg.save()
        return HttpResponse("<script>alert('Inserted..');window.location ='login';</script>")
    else:
       return render(request, "handi/register.html")

#District

def district(request):
    if request.method == 'POST':
        dist=District()
        dname=request.POST.get("dname")
        dist.dname=dname
        dist.save()
    return render(request, "administrator/district.html")


def districtview(request):
    dis = District.objects.all()
    return render(request, "administrator/ViewDistrict.html", {'dis': dis})




#end of district

#Category

def category(request):
    if request.method=='POST':
        cat=Category()
        cat_name=request.POST.get("name")
        cat.CategoryName=cat_name
        cat.save()
    return render(request,"administrator/category.html")



def categoryview(request):
    cat = Category.objects.all()
    return render(request, "administrator/ViewCategory.html", {'cat': cat})

#ENd of category


#Location

def locationadd(request):

    if request.method=='POST':
        dis = District.objects.get(DistrictId=request.POST.get('district'))
        #return  HttpResponse(category)
        name=request.POST.get('locationname')
        lo=Location()
        lo.LocationName=name
        lo.district=dis
        lo.save()
        dis = District.objects.all()
        return render(request, 'administrator/LocationAdd.html', {'dis': dis})
    else:
        dis = District.objects.all()
        return render(request, 'administrator/LocationAdd.html', {'dis': dis})

def locationview(request):

    lo = Location.objects.all()
    return render(request, "administrator/ViewLocation.html", {'lo': lo})

#ENd of location


def agencyh(request):
    return render(request, "handi/Agency/agencyhome.html")

def agencyreg(request):
    if request.method == 'POST':


        lo = Location.objects.get(LocationId=request.POST.get("location"))
        agen = Agency()
        name = request.POST.get("aname")
        address = request.POST.get("address")
        pin = request.POST.get("pin")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        license=request.POST.get("licenseno")
        uname=request.POST.get("uname")
        password=request.POST.get("password")
        log=Login()
        log.username=uname
        log.password=password
        log.role="Agency"
        log.status=0
        log.save()
        agen.AgencyName=name
        agen.address=address
        agen.location=lo
        agen.pin=pin
        agen.email=email
        agen.phone=phone
        agen.login=log
        agen.save()
        return HttpResponse("<script>alert('Inserted..');window.location ='../';</script>")
        #return redirect('index')

    else:
        lo = Location.objects.all()
        context = {'lo': lo}
        return render(request, "Registration/AgencyRegister.html",context)




def agencyview(request):
    agen=Agency.objects.select_related('login').filter(login__status=1)
    return render(request, "Administrator/AgencyView.html", {"agen":agen})


def agencyviewnotconfirmed(request):
    agen=Agency.objects.select_related('login').filter(login__status=0)
    return render(request, "Administrator/ApproveAgency.html", {"agen":agen})

def approveagency(request,id):

    if id:

        obj = Login.objects.get(LoginId=id)
        #return HttpResponse(obj.status)
        obj.status = 1
        obj.save()
    return agencyviewnotconfirmed(request)


def agencyviewproduct(request):
    alid=request.session.get("loginid")
    ag=Agency.objects.get(login_id=alid)
    p=Product.objects.filter(agency_id=ag.AgencyId,status=0)
    return render(request, "Agency/ViewProduct.html", {"p": p})


def agencyprofileedit(request):
    if ("loginid" in request.session):
        if request.method == 'POST':
            name = request.POST.get('name')
            add = request.POST.get('address')
            pin = request.POST.get('pin')
            email = request.POST.get('email')
            ph = request.POST.get('phone')

            ag = Agency.objects.get(login_id=request.session["loginid"])
            # ag=Agency.objects.get(AgencyId=ag1.AgencyId)
            ag.AgencyName = name
            # return HttpResponse(request.session["loginid"])
            ag.address = add
            ag.pin = pin
            ag.email = email
            ag.phone = ph
            ag.save()
        login_id = request.session['loginid']
        if (Agency.objects.filter(login_id=login_id).exists()):
            agen = Agency.objects.get(login_id=login_id)
            return render(request, 'Agency/AgencyEditProfile.html', {'agen': agen})

    return render(request, 'Agency/AgencyEditProfile.html')


def approveproduct(request,id):

    if id:

        p = Product.objects.get(ProductId=id)
        #return HttpResponse(obj.status)
        p.status = 1
        p.save()
    return agencyviewproduct(request)


def coustomerh(request):
    return render(request, "handi/Coustmer/coustomerhome.html")

def customerregister(request):
    if request.method == 'POST':

        lo = Location.objects.get(LocationId=request.POST.get("location"))
        cust = CustomerReg()
        name = request.POST.get("cname")
        address = request.POST.get("caddress")
       # return HttpResponse(address)
        gender=request.POST.get("rblgender")
        dob=request.POST.get("cdob")

        email = request.POST.get("cemail")
        phone = request.POST.get("cphone")
        uname = request.POST.get("uname")
        password = request.POST.get("password")
        log = Login()
        log.username = uname
        log.password = password
        log.role = "Customer"
        log.status = 1
        log.save()

        cust.CusttomerName=name
        cust.address=address
        cust.location=lo
        cust.gender=gender
        cust.dob=dob

        cust.email=email
        cust.phone=phone
        cust.login=log
        cust.save()

        b = bank()
        b.balance = request.POST.get("balance")
        b.cardno = request.POST.get("cardno")
        b.cvv = request.POST.get("cvv")
        b.username = request.POST.get("uname")
        b.save()

        return HttpResponse("<script>alert('Inserted..');window.location ='../';</script>")
    else:
        loc = Location.objects.all()
        context = {'loc': loc}
        return render(request, "Registration/CustomerRegister.html", context)

def handicrafth(request):
        return render(request, "handi/handicraft/handicrafth.html")

def handiregister(request):
    if request.method == 'POST':

        agency=Agency.objects.get(AgencyId=request.POST.get("agencyname"))
        han=HandicrafterReg()
        name=request.POST.get("hname")
        address=request.POST.get("haddress")
        dob=request.POST.get("dob")
        phone=request.POST.get("phone")
        email=request.POST.get("email")
        uname = request.POST.get("uname")
        password = request.POST.get("password")
        log = Login()
        log.username = uname
        log.password = password
        log.role = "Handicrafter"
        log.status = 0
        log.save()

        han.HandicrafterName=name
        han.address=address
        han.dob=dob
        han.email=email
        han.phone=phone
        han.agency=agency
        han.login=log
        han.save()
        return HttpResponse("<script>alert('Inserted..');window.location ='../';</script>")
    else:
        ag = Agency.objects.all()
        context = {'ag':ag}
        return render(request, "Registration/HandicrafterRegister.html", context)

def handiprofile(request):
    if ("loginid" in request.session):
        if request.method == 'POST':
            name = request.POST.get('name')
            #return HttpResponse(name)
            add = request.POST.get('address')
            ph = request.POST.get('phone')
            email = request.POST.get('email')


            h = HandicrafterReg.objects.get(login_id=request.session["loginid"])
            h.HandicrafterName = name
            h.address = add

            h.email = email
            h.phone = ph
            h.save()
        login_id = request.session['loginid']
        if (HandicrafterReg.objects.filter(login_id=login_id).exists()):
            h = HandicrafterReg.objects.get(login_id=login_id)
            return render(request, 'Handicrafter/Handiprofile.html', {'h': h})

    return render(request, 'Handicrafter/Handiprofile.html')


def viewhandicrafter(request):
    agid=request.session.get('loginid')
    #return HttpResponse(agid)
    ag=Agency.objects.get(login_id=agid)
    handi=HandicrafterReg.objects.select_related('login').filter(login__status=0,agency=ag.AgencyId)

    #std = tblregister.objects.select_related('tbllogin').filter(tbllogin__role="freelancer", tbllogin__status=1)
    return render(request, "Agency/ViewHandicrafter.html",{"handi":handi})


def viewhandicraftersbyadmin(request):
    handi=HandicrafterReg.objects.select_related('login').filter(login__status=1)
    return render(request, "Administrator/ViewHandicrafters.html",{"handi":handi})


def logout(request):
    if "loginid" in request.session:
        del request.session["loginid"]
    return render(request, 'GuestUsers/Login.html')

def approvehandicrafter(request,id):

    if id:

        obj = Login.objects.get(LoginId=id)
        #return HttpResponse(obj.status)
        obj.status = 1
        obj.save()
    return viewhandicrafter(request)

#end of Agency

def adminh(request):
        return render(request, "handi/admin/adminh.html")

def logincheck(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        if Login.objects.filter(username=username, password=password).exists():
            loginobj = Login.objects.get(username=username, password=password)
            request.session['uname'] = loginobj.username
            request.session['loginid'] = loginobj.LoginId
            role = loginobj.role
            if role == "Agency":
                if loginobj.status==1:

                    return render(request,'Agency/AgencyHome.html')
                else:
                    #return render(request, "GuestUsers_old/Login_old.html",{"error":"Pls wait for confirmation"})
                    return render(request, "GuestUsers/Login.html", {"error": "Pls wait for confirmation"})
            elif role == "Handicrafter":

                if loginobj.status == 1:

                    return render(request, 'Handicrafter/HandicrafterHome.html')
                else:
                    #return render(request, "GuestUsers_old/Login_old.html", {"error": "Pls wait for confirmation"})
                    return render(request, "GuestUsers/Login.html", {"error": "Pls wait for confirmation"})

            elif role == "admin":
                return render(request, 'Administrator/AdminHome.html')

            else:
                return render(request, 'Customer/customerhome.html')

        else:
            context = {"error": "incorrect user name or password"}
            #return render(request, "GuestUsers_old/login.html", context)
            return render(request, "GuestUsers/login.html", context)
    else:
        #return render(request,"GuestUsers_old/login.html")
        return render(request, "GuestUsers/login.html")


#product
def addproduct(request):
    if request.method == 'POST':
        hlogid=request.session.get("loginid")
        hid=HandicrafterReg.objects.get(login_id=hlogid)
        pname = request.POST.get("name")
        des = request.POST.get("description")
        cat = Category.objects.get(CategoryId=request.POST.get("Category"))
        price = request.POST.get("price")
        photo=request.FILES.get('photo')
        p=Product()
        p.productname=pname
        p.description=des
        p.price=price
        p.cat_id=cat
        p.photo=photo
        p.agency=Agency.objects.get(AgencyId=hid.agency_id)
        p.handicarft=HandicrafterReg.objects.get(HandicrafterId=hid.HandicrafterId)
        p.status=0
        p.save()
    cat=Category.objects.all()
    #return HttpResponse(cat)
    return render(request, "Handicrafter/AddProduct.html",{"cat":cat})

#end product

def viewproduct(request):

    pro=Product.objects.filter(status=1)
    return render(request, "Customer/customerhome.html", {"pro": pro})



def vieworderhandicrafter(request):
    hlogid = request.session.get("loginid")

    hid = HandicrafterReg.objects.get(login_id=hlogid)
    l=[]
    handi = Product.objects.select_related('handicarft').filter(handicarft_id=hid.HandicrafterId)
    for x in handi:


        car=Cart.objects.select_related('product').filter(product_id=x.ProductId)
        l.extend(car)


    return render(request, "Handicrafter/ViewOrder.html", {"car": l})


def viewproducthandicrafter(request):
    hlogid = request.session.get("loginid")
    hid = HandicrafterReg.objects.get(login_id=hlogid)
    #return HttpResponse(hid.HandicrafterId)
    pro=Product.objects.filter(handicarft_id=hid.HandicrafterId)
    return render(request, "Handicrafter/ViewProduct.html", {"pro": pro})

def addtocart(request):
    if request.method == 'POST':

        if 'submit' in request.POST:
            proid = request.POST.get("submit")
            p = Product.objects.get(ProductId=proid)
            cart = Cart()
            cart.price = p.price
            cust = CustomerReg.objects.get(login_id=request.session.get("loginid"))
            cart.customer = CustomerReg.objects.get(CustomerId=cust.CustomerId)
            cart.noofqunatity = request.POST.get("quantity")
            cart.status = 0
            cart.product = Product.objects.get(ProductId=proid)
            cart.save()
            return viewcart(request)
        if '_submit' in request.POST:
            #return HttpResponse("aa")
            proid = request.POST.get("_submit")
            p = Product.objects.get(ProductId=proid)
            cart = Cart()
            cart.price = p.price
            cust = CustomerReg.objects.get(login_id=request.session.get("loginid"))
            cart.customer = CustomerReg.objects.get(CustomerId=cust.CustomerId)
            cart.noofqunatity = request.POST.get("quantity")
            cart.status = 5
            cart.product = Product.objects.get(ProductId=proid)
            cart.save()
            return viewbuyproduct(request)

        # return HttpResponse("hai")
        #proid = request.POST.get("submit")
        #proid=request.POST.get("h1")
        #return HttpResponse(proid)

   # cart.customer=request.session.get("loginid")
        #cart.customer=CustomerReg.objects.get(CustomerId=cust.CustomerId)
        #cart.noofqunatity=request.POST.get("quantity")
        #if request.POST.get("submit") == 'Addtocart':
           # return HttpResponse("dd")
           # cart.status=0
           # cart.product=Product.objects.get(ProductId=proid)
           # cart.save()
           # return viewcart(request)
        #elif request.POST.get("submit") == 'Buy Now':
           # return HttpResponse("dd")
           # cart.status = 5
           # cart.product = Product.objects.get(ProductId=proid)
           # cart.save()
           # return viewbuyproduct(request)

    return viewproduct(request)


def viewbuyproduct(request):
    lid = request.session.get("loginid")
    cid = CustomerReg.objects.get(login_id=lid)
    ca = Cart.objects.filter(status=5,customer_id=cid.CustomerId)
    s = 0
    for i in ca:
        if (i.status == 5):
            s += i.price * i.noofqunatity
           # return HttpResponse(s)
    # total_price = Cart.objects.sum('')
    # return HttpResponse(total_price)
    return render(request, "Customer/ViewBuyProduct.html", {"ca": ca, 's': s})



def viewcart(request):
    lid=request.session.get("loginid")
    cid=CustomerReg.objects.get(login_id=lid)
    ca=Cart.objects.filter((Q(status=0) | Q(status=3)),customer_id=cid.CustomerId)
    s=0
    for i in ca:
        if(i.status==0):

            s+=i.price*i.noofqunatity
    #total_price = Cart.objects.sum('')
    #return HttpResponse(total_price)
    return render(request, "Customer/ViewCart.html", {"ca": ca,'s':s})


def removecart(request,id):
    data = Cart.objects.get(CartId=id)
    data.delete()
    return viewcart(request)


def movetocartitem(request,id):
    data = Cart.objects.get(CartId=id)
    data.status=0
    data.save()
    return viewcart(request)

def placeorder(request):
    lid = request.session.get("loginid")
    cid = CustomerReg.objects.get(login_id=lid)
    ca = Cart.objects.filter(status=0, customer_id=cid.CustomerId)
    s = 0
    for i in ca:
        if (i.status == 0):
            s += i.price * i.noofqunatity
    # total_price = Cart.objects.sum('')
    # return HttpResponse(total_price)
    request.session["gtotal"]=s
    return render(request, "Customer/CartSection.html",{"ca":ca,'s':s})

'''def placeorderbuyproduct(request):
    lid = request.session.get("loginid")
    cid = CustomerReg.objects.get(login_id=lid)
    ca = Cart.objects.filter(status=5, customer_id=cid.CustomerId)
    s = 0
    for i in ca:
        if (i.status == 5):
            s += i.price * i.noofqunatity
    # total_price = Cart.objects.sum('')
    # return HttpResponse(total_price)
    request.session["gtotal"]=s
    return render(request, "Customer/CartSection.html",{"ca":ca,'s':s})'''


def payment(request):
    username=request.session.get("uname")
    gt=request.session.get("gtotal")
    b=bank.objects.get(username=username)
    bamount=b.balance
    #return HttpResponse(gt)
    if b.balance>gt:
        nbamaount=b.balance-gt
        b.balance=nbamaount
        b.save()
        lid = request.session.get("loginid")
        cid = CustomerReg.objects.get(login_id=lid)
        ca = Cart.objects.filter(status=0, customer_id=cid.CustomerId)
        Cart.objects.filter(status=0, customer_id=cid.CustomerId).delete()
        return render(request, "Customer/PaymentSuccess.html")
    elif b.balance<gt:
        return render(request, "Customer/failure.html")
        #return render(request, "Customer/CartSection.html", {"msg":"Not sufficient amount"})

def paymentbuyproduct(request):
    username=request.session.get("uname")
    gt=request.session.get("gtotal")
    #return HttpResponse(gt)
    b=bank.objects.get(username=username)
    bamount=b.balance
    #return HttpResponse(gt)
    if b.balance>gt:
        nbamaount=b.balance-gt
        b.balance=nbamaount
        b.save()
        lid = request.session.get("loginid")
        cid = CustomerReg.objects.get(login_id=lid)
        ca = Cart.objects.filter(status=5, customer_id=cid.CustomerId)
        Cart.objects.filter(status=5, customer_id=cid.CustomerId).delete()
        return render(request, "Customer/PaymentSuccess.html")
    elif b.balance<gt:
        return render(request, "Customer/ViewBuyProduct.html", {"msg":"Not sufficient amount"})








def savecartitemlater(request,id):
    data = Cart.objects.get(CartId=id)
    data.status=3
    data.save()
    return viewcart(request)

def approve(request):
      usertype=request.session.get('usertype')
      #login = Login.objects.all()
      handi = HandiReg.objects.all()
      agency =Agency.objects.all()
      context = {'handi': handi,'agency': agency}
      return render(request, 'handi/admin/approve.html', context)
     #return HttpResponse("k")

def approveid(request,id):
    #id=City.objects.get(id=request.POST.get("city"))
    login = Login.objects.get(id=id)
    #id = login.pk
    status = request.session.get('status')
    login.status =0+1
    login.save()
    return HttpResponse("<script>alert('Approved..');window.location ='../approve';</script>")

def bidd(request):
    if request.method == 'POST':
        b=Bidd()
        startdata=request.POST.get("startdata")
        enddata=request.POST.get("enddata")
        startingprice=request.POST.get("startingprice")
        status=request.POST.get("status")
        highestprice=request.POST.get("highestprice")
        userid = Login.objects.get(id=request.session.get("userid"))
        b.startdata=startdata
        b.enddata=enddata
        b.startingprice=startingprice
        b.status=status
        b.highestprice=highestprice
        b.login=userid
        b.save()
        return HttpResponse("<script>alert('Inserted..');window.location ='adminthome';</script>")
    else:
        return render(request, "admin/biddpage.html")


